//
//  LogView.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import SwiftData
import SwiftUI

struct LogView: View {
    @FocusState var focusedTextEdit: Bool
    
    @State var log: Log
    
    @State private var oldLogContent: String = ""

    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
        
    var body: some View {
        NavigationStack {
            TextEditor(text: $log.content)
                .ignoresSafeArea()
                .padding(.horizontal)
                .focused($focusedTextEdit)
                .onAppear {
                    oldLogContent = Log.trimDate(on: log.content)
                    
                    changeTextEditorFocus()
                }
                .onDisappear {
                    saveLog(log)
                }
                .toolbar {
                    if focusedTextEdit {
                        ToolbarItem(placement: .primaryAction) {
                            Button("Ok") {
                                saveLog(log)
                                
                                focusedTextEdit = false
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .status) {
                        Text("\(log.modificationDate.formatted(date: .long, time: .shortened))")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
        }
        
    }
    
    func changeTextEditorFocus() {
        if oldLogContent == "" {
            focusedTextEdit = true
        } else {
            focusedTextEdit = false
        }
    }
    
    func saveLog(_ log: Log) {
        let newLogContent = Log.trimDate(on: log.content)
        
        if newLogContent != "" {
            if newLogContent != oldLogContent {
                log.modificationDate = .now
                
                modelContext.insert(log)
            }
            
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Log.self, configurations: config)
        
        return LogView(log: SampleJournee.allLogs[3])
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
