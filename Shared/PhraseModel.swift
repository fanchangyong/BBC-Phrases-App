//
//  PhraseModel.swift
//  Multiplatform
//
//  Created by Changyong Fan on 2021/12/16.
//

import Foundation

struct Phrase: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var url: String
    var imageURL: String
    var desc: String?
    var sentences: [String]?
}

var phrases: [Phrase] = []
