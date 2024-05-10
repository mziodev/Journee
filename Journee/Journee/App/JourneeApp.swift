//
//  JourneeApp.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import SwiftData
import SwiftUI

@main
struct JourneeApp: App {
    var body: some Scene {
        WindowGroup {
            JourneeView()
        }
        .modelContainer(previewContainer)
    }
}
