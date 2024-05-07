//
//  ContentView.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(1..<31) { log in
                    Text("2024-04-\(31 - log)")
                }
            }
            .navigationTitle("Journee")
        }
    }
}

#Preview {
    ContentView()
}
