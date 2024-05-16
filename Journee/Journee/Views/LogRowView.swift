//
//  LogRowView.swift
//  Journee
//
//  Created by MZiO on 7/5/24.
//

import SwiftData
import SwiftUI

struct LogRowView: View {
    let log: Log
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(log.creationDate.shortDateOnly)
                    .font(.headline)
                
                Text(Log.trimDate(on: log.content))
                    .lineLimit(1)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

#Preview {
    LogRowView(log: SampleData.shared.log)
        .padding()
}
