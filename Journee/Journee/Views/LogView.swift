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
        TextEditor(text: $log.content)
    }

}

#Preview {
    LogView(log: journee[0])
}
