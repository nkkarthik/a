import * as vscode from 'vscode';

/*

pwd

*/

export function activate(context: vscode.ExtensionContext) {
    let disposable = vscode.commands.registerCommand('k.executeSelectedLine', async () => {
        const editor = vscode.window.activeTextEditor;
        if (!editor) { return }

        const uri = editor.document.uri
        const { name, dir } = uriPathSplit(uri)

        // let term = vscode.window.activeTerminal
        // if (!term) {
        //     term = vscode.window.createTerminal('k')
        // }
        let term = findTerminalByName(name)
        if (!term) {
            term = vscode.window.createTerminal({
                name: name,
                cwd: dir,
            })
        }

        const pos = editor.selection.active
        const selection = editor.document.getText(editor.selection);
        let text = selection
        if (!text) {
            text = editor.document.lineAt(pos.line).text
        }
        
        term.show(true) // preserveFocus = true
        // vscode.commands.executeCommand('workbench.action.terminal.scrollToBottom')
        term.sendText(text, true)

        // Small delay to ensure terminal processes the input
        // await new Promise(resolve => setTimeout(resolve, 100));

        // Focus back to editor
        // await vscode.commands.executeCommand('workbench.action.focusActiveEditorGroup');

        // Move cursor to the next line
        const nextLine = Math.min(pos.line + 1, editor.document.lineCount - 1);
        const newPosition = new vscode.Position(nextLine, 0);
        editor.selection = new vscode.Selection(newPosition, newPosition);
        editor.revealRange(new vscode.Range(newPosition, newPosition));
    });

    context.subscriptions.push(disposable);
}

export function deactivate() {}

function uriPathSplit(uri: vscode.Uri) {
    const segs = uri.path.split('/')
    const name = segs.pop() // remove filename
    const dir = segs.join('/')
    return {name, dir}
}

function findTerminalByName(name?: string) {
    const terms = vscode.window.terminals
    for (let term of terms) {
        if (term.name == name) {
            return term
        }
    }
}