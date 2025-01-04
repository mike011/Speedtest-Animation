//
//  ContentView.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-11-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            VStack(spacing: 4) {
                HStack() {
                    Image("world")
                    Text("China Telecom")
                }
                HStack() {
                    Image("wifi")
                    VStack() {
                        HStack() {
                            Text("YunJinTianFu")
                            Button("Link") {
                            }
                        }
                        Text("Chengdu")
                    }
                }
                Button("Start") {
                }
            }
             .tabItem {
                Image("first-tab")
              }
        }.tabItem { Image("first-tab") }
    }
}

#Preview {
    ContentView()
}
