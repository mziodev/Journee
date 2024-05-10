//
//  PreviewSampleData.swift
//  Journee
//
//  Created by MZIO on 10/5/24.
//

import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Log.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
            )
        )
        
        let modelContext = container.mainContext
        
        if try modelContext.fetch(FetchDescriptor<Log>()).isEmpty {
            SampleJournee.allLogs.forEach {
                container.mainContext.insert($0)
            }
        }   
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
