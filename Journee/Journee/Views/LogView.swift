//
//  LogView.swift
//  Journee
//
//  Created by MZiO on 7/5/24.
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
                .padding()
                .focused($focusedTextEdit)
                .navigationTitle(log.creationDate.completeDateOnly)
                .navigationBarTitleDisplayMode(log.content.isEmpty ? .inline : .large)
                .navigationTitleToHeadline()
                .onAppear {
                    oldLogContent = log.content
                    
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
                        Text("\(log.modificationDate.longDateShorTime)")
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
        if log.content != "" {
            if log.content != oldLogContent {
                log.modificationDate = .now
                
                modelContext.insert(log)
            }
            
        }
    }
}

extension View {
    func navigationTitleToHeadline() -> some View {
        let font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .headline), size: 20)
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: font]
        
        return self
    }
}

#Preview {
    LogView(log: SampleData.shared.log)
}
