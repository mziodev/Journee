//
//  LogRowView.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import SwiftUI

struct LogRowView: View {
    let log: Log
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(log.creationDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.headline)
                
                Text(log.content)
                    .lineLimit(1)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

#Preview {
    LogRowView(log: journee[0])
        .padding()
}
