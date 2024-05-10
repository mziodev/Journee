//
//  ContentView.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import SwiftData
import SwiftUI

struct JourneeView: View {
    @Query(
        sort: \Log.creationDate,
        order: .reverse,
        animation: .easeInOut
    ) private var allLogs: [Log]
    
    @Environment(\.modelContext) var modelContext
    
    @State private var showingNewLogView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(allLogs, id: \.creationDate) { log in
                    NavigationLink(destination: LogView(log: log)) {
                        LogRowView(log: log)
                    }
                }
                .onDelete(perform: deleteLogs)
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
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("\(allLogs.count) entries")
                        .font(.caption)
                    Spacer()
                    Button {
                        showingNewLogView = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            .toolbarBackground(.visible, for: .bottomBar)
        }
    }
    
    func deleteLogs(at offSets: IndexSet) {
        for offSet in offSets {
            let log = allLogs[offSet]
            
            modelContext.delete(log)
        }
    }
}

#Preview {
    JourneeView()
        .modelContainer(previewContainer)
}
