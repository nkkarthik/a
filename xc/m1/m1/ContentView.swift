//
//  ContentView.swift
//  mk1
//
//  Created by Krishna Nannuru on 7/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var url = "http://localhost:30001/?folder=/Users/knannuru/m"
     

    var body: some View {
        VStack {
            LocalhostWebView(
                url: url,
                urlMappings: [
                    // m (solarized)
                    "1": "http://localhost:30001/?workspace=/Users/knannuru/m/.vscode/m.code-workspace",
                    // k (quite light / one dark pro)
                    "2": "https://k/?workspace=/home/knannuru/k/.vscode/k.code-workspace",
                    // work
                    "3": "https://k/?workspace=/home/knannuru/k/.vscode/cisd.code-workspace",
                    // help
                    "9": "https://chatgpt.com",
                ]
            )
        }
    }
}

#Preview {
    ContentView()
}
