//
//  LogView.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import SwiftData
import SwiftUI

struct LogView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @FocusState var focusedTextEdit: Bool
    
    @State var log: Log
        
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
                }
        }
        
    }
    
    func saveLog(_ log: Log) {
        if Log.trimDate(on: log.content) != "" {
            modelContext.insert(log)
        }
    }
}

#Preview {
    LogView(log: journee[0])
}
