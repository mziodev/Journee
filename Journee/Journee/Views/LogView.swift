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

    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
        
    var body: some View {
        NavigationStack {
            TextEditor(text: $log.content)
                .ignoresSafeArea()
                .padding(.horizontal)
                .focused($focusedTextEdit)
                .onAppear {
                    if Log.trimDate(on: log.content) == "" {
                        focusedTextEdit = true
                    } else {
                        focusedTextEdit = false
                    }
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
    
    func saveLog(_ log: Log) {
        if Log.trimDate(on: log.content) != "" {
            if focusedTextEdit {
                log.modificationDate = .now
            }
            
            modelContext.insert(log)
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
