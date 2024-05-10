//
//  LogRowView.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import SwiftData
import SwiftUI

struct LogRowView: View {
    let log: Log
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(log.creationDate.formatted(date: .abbreviated, time: .omitted))
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
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Log.self, configurations: config)
        
        return LogRowView(log: SampleJournee.allLogs[3])
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
