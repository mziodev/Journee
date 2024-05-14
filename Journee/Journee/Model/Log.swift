//
//  Log.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import Foundation
import SwiftData

@Model
class Log {
    let creationDate: Date
    var modificationDate: Date
    var content: String
    
    init(creationDate: Date, modificationDate: Date, content: String) {
        self.creationDate = creationDate
        self.modificationDate = modificationDate
        self.content = """
        \(creationDate.formatted(date: .abbreviated, time: .omitted))
        
        \(content)
        """
    }
    
    static func trimDate(on content: String) -> String {
        return String(content.components(separatedBy: "\n")[2])
    }
    
    static let sampleData = [
        Log(creationDate: .now - (86400 * 3),
            modificationDate: .now - (86400 * 3),
            content: "This is my first entry for the Journee app, what do you think?"),
        Log(creationDate: .now - (86400 * 2),
            modificationDate: .now - (86400 * 2),
            content: "This is my second entry for my journee."),
        Log(creationDate: .now - 86400,
            modificationDate: .now - 86400, content: "This is my third entry for Journee."),
        Log(creationDate: .now,
            modificationDate: .now, content: "This is my fourth entry for the Journee app. This is been a great experience so far 😍")
    ]
}
