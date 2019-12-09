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
    var networkService: NetworkService!
    var mockSession: MockURLSession!
    var category: Category!

    override func setUp() {
        super.setUp()
        game = Game(word: "Яблоко", incorrectMovesRemaining: 5, guestLetters: [], addedletter: 2)
        mockSession = MockURLSession()
        networkService = NetworkService(withSession: mockSession)
        category = Category(id: 1, name: "Имя")
    }

    override func tearDown() {
        game = nil
        networkService = nil
        mockSession = nil
        category = nil
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
    
    func testThatCheckLoadedCategoriesIsNotNill() {
        // arrange
        let promise = expectation(description: "Completion get data")
        let data = Data(base64Encoded: "267454238428")
        mockSession.data = data
        var responseData: Data?
        //act
        networkService.loadCategories { (category) in
            responseData = data
            promise.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        //assets
        XCTAssertNotNil(responseData)
    }
    
    func testThatCheckLoadedWordsIsNotNill() {
        // arrange
        let promise = expectation(description: "Completion get data")
        let data = Data(base64Encoded: "267454238428")
        mockSession.data = data
        var responseData: Data?
        //act
        networkService.loadWords(for: category) { (categoryWord) in
            responseData = data
            promise.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        //assets
        XCTAssertNotNil(responseData)
    }
    

}
