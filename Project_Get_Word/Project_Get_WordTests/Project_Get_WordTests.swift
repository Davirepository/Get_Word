//
//  Project_Get_WordTests.swift
//  Project_Get_WordTests
//
//  Created by Давид on 08/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import XCTest
@testable import Project_Get_Word

class Project_Get_WordTests: XCTestCase {
    
    var game: Game!

    override func setUp() {
        super.setUp()
        game = Game(word: "Яблоко", incorrectMovesRemaining: 5, guestLetters: [], addedletter: 2)
    }

    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    func testThatChecksThatTheAddedLetterIsNotContainedInTheWord() {
        // arrange
        let numberOfAttempts = 4
        let letter: Character = "в"
        // act
        game.playerGuessed(letter: letter)
        //assert
        XCTAssertEqual(numberOfAttempts, game.incorrectMovesRemaining, "incorrectMovesRemaining computed from letter is wrong")
    }
    
    func testThatChecksThatArrayOfLettersIsChanged() {
        // arrange
        let guestLetters = 1
        let letter: Character = "в"
        // act
        game.playerGuessed(letter: letter)
        //assert
        XCTAssertEqual(guestLetters, game.guestLetters.count, "letter was not added into guestLetters array")
    }
    
    func testThatChecksThatFreeLetterWasUssed() {
        // arrange
        let freeLetter = 1
        // act
        game.freeLetters()
        //assert
        XCTAssertEqual(freeLetter, game.addedletter, "freeLetters was not used")
    }

}
