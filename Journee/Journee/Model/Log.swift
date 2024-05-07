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
    Log(creationDate: .now, modificationDate: .now, content: "This is my first entry for the Journee."),
    Log(creationDate: .now + 86400, modificationDate: .now + 86400, content: "This is my second entry for my Journee."),
    Log(creationDate: .now + (86400 * 3), modificationDate: .now + (86400 * 3), content: "This is my second entry for my Journee.")
]
