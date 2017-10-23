//
//  File.swift
//  BowlingKata
//
//  Created by Craig Clayton on 10/8/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import Foundation

struct Game {
    
    private var roll = 0
    private var rolls:[Int] = []
    
    mutating func scoreRoll(with pinsDown:Int) {
        rolls.insert(pinsDown, at: self.roll)
        self.roll += 1
    }
    
    func score() -> Int {
        var currentScore = 0
        var cursor = 0
        
        for _ in 0..<10 {
            if isStrike(with: cursor) {
                currentScore += 10 + rolls[cursor+1] + rolls[cursor+2]
                cursor += 1
            }
            else if isSpare(with: cursor) {
                currentScore += 10 + rolls[cursor+2]
                cursor += 2
            }
            else {
                currentScore += rolls[cursor] + rolls[cursor+1]
                cursor += 2
            }
        }
        
        return currentScore
    }
    
    func isStrike(with cursor: Int) -> Bool {
        return rolls[cursor] == 10
    }
    
    func isSpare(with cursor:Int) -> Bool {
        return rolls[cursor] + rolls[cursor+1] == 10
    }
    
    mutating func roll(_ value:[Int]...) {
        for i in value.flatMap({$0}) {
            scoreRoll(with: i)
        }
    }
}
