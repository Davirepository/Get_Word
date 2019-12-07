//
//  ResultVCUIConstraints.swift
//  Project_Get_Word
//
//  Created by Давид on 07/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

extension ResultViewController {
    func setupConstraints() {
        view.addSubview(resultLabel)
        view.addSubview(scoreLabel)
        view.addSubview(homeButton)
        view.addSubview(tryAgainButton)
        
        resultLabel.bottomAnchor.constraint(equalTo: scoreLabel.topAnchor, constant: -20).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        homeButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 30).isActive = true
        homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        tryAgainButton.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 20).isActive = true
        tryAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tryAgainButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tryAgainButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
