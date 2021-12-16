//
//  PhraseModel.swift
//  Multiplatform
//
//  Created by Changyong Fan on 2021/12/16.
//

import Foundation

struct Phrase: Hashable, Codable, Identifiable {
    var id: String
    var url: String
    var title: String
    var date: String
    var imageURL: String
    var richtext: String
}

struct PhraseDetail: Hashable, Codable {
    var description: String
    var sentences: [String]
}


/*
var phrases: [Phrase] = [
    Phrase(id: 1, title: "Larger than life 非同凡响，耀眼夺目", date: "EPISODE 211202 / 02 DEC 2021", description: "XXX", imageURL: "https://ichef.bbci.co.uk/images/ic/256xn/p0b34w73.jpg"),
]
 */
