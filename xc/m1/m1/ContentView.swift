//
//  ContentView.swift
//  mk1
//
//  Created by Krishna Nannuru on 7/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var url = "http://localhost:30001/?folder=/Users/knannuru/m"
    @State private var showHelp = true
    
    private var url3: String
    private var url9: String

    init() {
        self.url3 = Bundle.main.object(forInfoDictionaryKey: "URL3") as! String
        self.url9 = "https://chatgpt.com"
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                LocalhostWebView(
                    url: url,
                    onKeys: { keys in
                        switch keys {
                        case "9":
                            showHelp.toggle()
                        default:
                            break
                        }
                    },
                    urlMappings: [
                        // m (solarized)
                        "1": "http://localhost:30001/?workspace=/Users/knannuru/m/.vscode/m.code-workspace",
                        // k (quite light / one dark pro)
                        "2": "https://k/?workspace=/home/knannuru/k/.vscode/k.code-workspace",
                        // work (light modern / dark modern)
                        "3": url3,
                    ]
                )
                .frame(width: geometry.size.width * (showHelp ? 0.618 : 1))
                LocalhostWebView(
                    url: url9,
                    onKeys: { keys in
                        switch keys {
                        case "9":
                            showHelp.toggle()
                        default:
                            break
                        }
                    },
                    urlMappings: [:],
                )
                .frame(width: geometry.size.width * (showHelp ? 0.382 : 0))
                .opacity(showHelp ? 1 : 0)
            }
        }
    }
}

#Preview {
    ContentView()
}
