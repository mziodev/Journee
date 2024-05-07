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
                ForEach(journee, id: \.creationDate) { log in
                    Text(
                        log.creationDate.formatted(
                            date: .abbreviated,
                            time: .omitted
                        )
                    )
                }
            }
            .navigationTitle("Journee")
        }
    }
}

#Preview {
    ContentView()
}
