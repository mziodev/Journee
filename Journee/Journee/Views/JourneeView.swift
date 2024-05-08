//
//  ContentView.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import SwiftUI

struct JourneeView: View {
    @State private var showingNewLogView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(journee, id: \.creationDate) { log in
                    NavigationLink(destination: LogView(log: log)) {
                        LogRowView(log: log)
                    }
                }
            }
            .navigationTitle("Journee")
            .navigationDestination(isPresented: $showingNewLogView) {
                let newLog = Log(
                    creationDate: .now,
                    modificationDate: .now,
                    content: ""
                )
                
                LogView(log: newLog)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingNewLogView = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
                
                ToolbarItem(placement: .status) {
                    Text("\(journee.count) entries")
                        .font(.caption)
                }
            }
            .toolbarBackground(.visible, for: .bottomBar)
        }
    }
}

#Preview {
    JourneeView()
}
