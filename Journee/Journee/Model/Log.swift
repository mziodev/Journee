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
    @Attribute(.unique) let creationDate: Date
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
}
