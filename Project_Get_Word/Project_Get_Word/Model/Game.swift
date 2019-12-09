//
//  Game.swift
//  Project_Get_Word
//
//  Created by Давид on 02/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

struct Game {
    /// угадываемое слово
    var word: String
    /// колличесво попыток
    var incorrectMovesRemaining: Int
    /// список нажатых букв
    var guestLetters: [Character]
    /// колличество подсказок
    var addedletter: Int
    
    /// отображает угадываемые буквы или прочерки(форматирует входящее слово взависимости от содержания guestLetters)
    var formattedWord: String {
        var guessedWord = ""
        
        // check that our word have letters that were tapped
        for letter in word {
            if guestLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    /// функция которая добавляет нажатую букву в массив guestLetters(обработка нажатой буквы)
    mutating func playerGuessed(letter: Character) {
            guestLetters.append(letter)
            // проверяем попала ли нажатая буква в массив букв угадываемого слова(если не попала, то уменьшаем  кол-во попыток)
            if !word.contains(letter) {
                incorrectMovesRemaining -= 1
            }
            print("add")
    }
    mutating func freeLetters() {
        addedletter -= 1
        print(addedletter)
    }
}
