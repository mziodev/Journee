//
//  ContentView.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import SwiftUI

struct JourneeView: View {
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
            .toolbarBackground(.visible, for: .bottomBar)
            .toolbar {
                ToolbarItem(placement: .status) {
                    Text("\(journee.count) entries")
                        .font(.caption)
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

#Preview {
    JourneeView()
}
