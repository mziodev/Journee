//
//  SampleJournee.swift
//  Journee
//
//  Created by MZIO on 10/5/24.
//

import Foundation

struct SampleJournee {
    static var allLogs: [Log] = [
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
