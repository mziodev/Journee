//
//  Log.swift
//  Journee
//
//  Created by MZIO on 7/5/24.
//

import Foundation

struct Log {
    let creationDate: Date
    var modificationDate: Date
    var content: String
}

let journee = [
    Log(creationDate: .now, modificationDate: .now, content: "This is my first entry for the Journee app, what do you think?"),
    Log(creationDate: .now + 86400, modificationDate: .now + 86400, content: "This is my second entry for my journee."),
    Log(creationDate: .now + (86400 * 3), modificationDate: .now + (86400 * 3), content: "This is my third entry for Journee.")
]
