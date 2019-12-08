//
//  GameViewController+CollectionViewDataSource.swift
//  Project_Get_Word
//
//  Created by Давид on 02/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCharsInRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.reuseIdentifier, for: indexPath) as! GameCollectionViewCell
        if indexPath.item == 0 && indexPath.section == 4 || indexPath.item == 6 && indexPath.section == 4{
            cell.alpha = 0
            cell.isUserInteractionEnabled = false
            return cell
        }
        cell.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1);
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.textLabel.text = keyboardLetters[indexPath.item + indexPath.section * 7]
        cell.isUserInteractionEnabled = true
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return lround(Double(keyboardLetters.count) / Double(numberOfCharsInRow))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidthSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 40)) / 8
        let itemHeightSize = (collectionView.frame.height - (collectionView.contentInset.top + collectionView.contentInset.bottom + 30)) / 6
        return CGSize(width: itemWidthSize, height: itemHeightSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let letterString = keyboardLetters[indexPath.item + indexPath.section * 7]
        let letter = Character(letterString.lowercased())
        let cells = collectionView.cellForItem(at: indexPath)
        cells?.alpha = 0.5
        if newGame.word.contains(letter) {
            cells?.backgroundColor = .green
            cells?.isUserInteractionEnabled = false
        } else {
            cells?.backgroundColor = .red
            cells?.isUserInteractionEnabled = false
        }
        newGame.playerGuessed(letter: letter)
        updateGameState()
    }
}
