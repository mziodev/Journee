//
//  SampleData.swift
//  Journee
//
//  Created by MZIO on 14/5/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var modelContext: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            Log.self,
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: true
        )

        do {
            modelContainer = try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
            
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertSampleData() {
        for log in Log.sampleData {
            modelContext.insert(log)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Sample data modelContext failed to save.")
        }
    }
    
    var log: Log {
        Log.sampleData[0]
    }
}

