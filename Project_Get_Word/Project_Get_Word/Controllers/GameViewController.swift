//
//  GameViewController.swift
//  Project_Get_Word
//
//  Created by Давид on 01/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    /// стеквью с imageView(жизни)
    var liveButtonsStackView: HeartStack!
    var collectionView: UICollectionView!
    var categoryLabel: UILabel!
    var scoreLabel: UILabel!
    var correctWordLabel: UILabel!
    var homeButton: UIButton!
    /// кнопка с подсказками
    var freeLetter: UIButton!
    
    /// если раннее выигрывали, то продолжаем счет 
    var scoreAfterWin = 0
    var newGame: Game!
    // массив с категориями
    var categoryWords: Category!
    /// выбранная категория
    var category = ""
    let numberOfCharsInRow = 7
    /// кол-во подсказок
    var numberOfFreeLetters = 0
    private let coreDataService = CoreDataService()
    private let networkService = NetworkService()
    
    private var listOfWords = Names.all

    /// кол-во попыток
    private let incorrectMovesAllowed = 6
    
    /// кол-во выигрышей(создаем новый раунд если выиграли)
    private var totalWins = 0 {
        didSet {
            scoreAfterWin += 1
            newRound()
        }
    }
    
    /// алфавит клавиатуры
    let keyboardLetters: Array<String> = Keyboard.all

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        setupUI()
        setupConstraints()
        categoryLabel.text = category
        
        if categoryWords.id != -1 {
            networkService.loadWords(for: categoryWords) { wordsFromApi in
                guard let words = wordsFromApi else { return }
                self.listOfWords = words.map { $0.title }
                guard !self.listOfWords.isEmpty, self.listOfWords != [] else {
                    DispatchQueue.main.async {
                        guard let navigation = self.navigationController else { return }
                        let resultVC = ResultViewController()
                        resultVC.resultLabel.text = "В категории пока нет слов. \n Выберите другую"
                        resultVC.scoreLabel.text = "Счет: \(self.scoreAfterWin)"
                        resultVC.homeButton.isHidden = true
                        navigation.pushViewController(resultVC, animated: false)
                    }
                    return }
                DispatchQueue.main.async {
                    self.newRound()
                }
            }
        }
        newRound()
    }
    
    /// Run new round when u choose category
    private func newRound() {
        if !listOfWords.isEmpty {
            let randomIndex = Int.random(in: 0..<listOfWords.count)
            let newWord = listOfWords.remove(at: randomIndex)
            freeLetter.isEnabled = true
            freeLetter.alpha = 1
            if newWord.count < 5 {
                numberOfFreeLetters = 1
            } else {
                numberOfFreeLetters = 2
            }
        // создаем новую игру/раунд
            newGame = Game(word: newWord.lowercased(), incorrectMovesRemaining: incorrectMovesAllowed, guestLetters: [], addedletter: numberOfFreeLetters)
            liveButtonsStackView.countLive = incorrectMovesAllowed
        // обновляем состояние кнопок
        collectionView.reloadData()
        } else {
            // если слова закончились то выводим на экран и говорим что вы угадали все слова
            endGame(isWin: true)
        }
        updateUI()
    }
    
    /// обновление интерфейса (счет, жизни, угадываемое слово)
    private func updateUI() {
        // обновляем UI
        if liveButtonsStackView.countLive != newGame.incorrectMovesRemaining {
            liveButtonsStackView.countLive = newGame.incorrectMovesRemaining
        }
        
        //update word
        var letters = [String]()
        for letter in newGame.formattedWord {
            letters.append(String(letter))
        }
        letters[0] = letters[0].capitalized
        let wordWithSpeces = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpeces
        
        // update score
        scoreLabel.text = "Счет: \(scoreAfterWin)"
        
        // update button with free letters
        if newGame.addedletter == 0 {
            freeLetter.isEnabled = false
            freeLetter.alpha = 0.5
        }
    }
    
    /// проверяем окончание игры
    func updateGameState() {
        if newGame.incorrectMovesRemaining < 1 {
            endGame(isWin: false)
        } else if newGame.word == newGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func endGame(isWin: Bool) {
        guard let navigation = navigationController else { return }
        let resultVC = ResultViewController()
        if isWin {
            resultVC.resultLabel.text = "You Win!!!"
            resultVC.scoreLabel.text = "Счет: \(scoreAfterWin)"
        } else {
            resultVC.resultLabel.text = "Wasted!!!"
            resultVC.scoreLabel.text = "Счет: \(scoreAfterWin)"
            resultVC.tryAgainButton.isHidden = true
        }
        resultVC.scoreAfterWins = scoreAfterWin
        navigation.pushViewController(resultVC, animated: false)
    }
    
    @objc func homeButtonTapped() {
        guard let navigation = navigationController else { return }
        let mainVC = MainViewController()
        coreDataService.saveInStorage(data: Int16(scoreAfterWin))
        navigation.pushViewController(mainVC, animated: false)
    }
    
    @objc func freeLetterButtonTapped() {
        var wordsArray: Array<Character> = []
        for word in newGame.word {
            if !newGame.guestLetters.contains(word) {
                wordsArray.append(word)
            }
        }
        let letter = Int.random(in: 0..<wordsArray.count)
        let randomChar: Character = wordsArray[letter]
        let indexPathLetter = keyboardLetters.firstIndex(of: String(randomChar.uppercased()))
        let section = indexPathLetter! / 7
        let item = indexPathLetter! / (section + 1)
        newGame.playerGuessed(letter: randomChar)
        collectionView.cellForItem(at: [section, item])?.backgroundColor = .green
        collectionView.cellForItem(at: [section, item])?.alpha = 0.5
        collectionView.cellForItem(at: [section, item])?.isUserInteractionEnabled = false
        newGame.freeLetters()
        updateGameState()
    }
}
