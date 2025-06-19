//
//  file.swift
//  Заметки
//
//  Created by dany on 11.06.2025.
//

import Foundation

struct Name {
    var dict: [String: String] = [:]
    mutating func newNout(noutName: String, text: String) {
        self.dict[noutName] = text
    }
}
