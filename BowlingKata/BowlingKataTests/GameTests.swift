//
//  GameTests.swift
//  BowlingKata
//
//  Created by Craig Clayton on 10/8/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import XCTest

@testable import BowlingKata
class GameTests: XCTestCase {
    
    var game:Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRoll_WithGutterGame_ShouldReturnZero() {
        game.roll([0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0])
        XCTAssertEqual(game.score(), 0)
    }
    
    func testRoll_WithGameOfOnes_ShouldReturnTwenty() {
        game.roll([1,1, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1])
        XCTAssertEqual(game.score(), 20)
    }
    
    func testRoll_WithSpareFollowedByThree_ShouldReturnSixteen() {
        game.roll([5,5, 3,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0])
        XCTAssertEqual(game.score(), 16)
    }
    
    func testRoll_WithStrikeFollowedByThreeThenThree_ShouldReturnTwentyTwo() {
        game.roll([10, 3,3, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0])
        XCTAssertEqual(game.score(), 22)
    }
    
    func testRoll_WithPerfectGame_ShouldReturnThreeHundred() {
        game.roll([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
        XCTAssertEqual(game.score(), 300)
    }
}
