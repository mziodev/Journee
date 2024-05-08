//
//  LogView.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import SwiftUI

struct LogView: View {
    @State var log: Log
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $log.content)
                .ignoresSafeArea()
                .padding(.horizontal)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Ok") {
                            // save actions
                        }
                    }
                }
        }
    }

}

#Preview {
    LogView(log: journee[0])
}
