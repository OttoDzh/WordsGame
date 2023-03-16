//
//  User.swift
//  WordsGame
//
//  Created by Otto Dzhandzhuliya on 26.02.2023.
//

import Foundation

class User {
    let name : String
    var score: Int = 0
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
