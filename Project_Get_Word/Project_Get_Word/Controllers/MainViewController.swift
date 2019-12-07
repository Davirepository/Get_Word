//
//  MainViewController.swift
//  Project_Get_Word
//
//  Created by Давид on 29/11/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var startButton: UIButton!
    private var scoreButton: UIButton!
    private var mainImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        setupUI()
        setupContstraints()
    }
    
    private func setupUI() {
        startButton = {
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.9863776967, green: 0.9863776967, blue: 0.9863776967, alpha: 1)
            button.setTitle("Начать", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 4
            button.layer.shadowRadius = 4
            button.layer.shadowOpacity = 0.5
            button.layer.shadowOffset = CGSize(width: 2, height: 3)
            button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        scoreButton = {
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.9863776967, green: 0.9863776967, blue: 0.9863776967, alpha: 1)
            button.setTitle("Счет", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 4
            button.layer.shadowRadius = 4
            button.layer.shadowOpacity = 0.5
            button.layer.shadowOffset = CGSize(width: 2, height: 3)
            button.addTarget(self, action: #selector(scoreButtonTapped), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        mainImage = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "homepage")
            imageView.clipsToBounds = true
            imageView.layer.shadowRadius = 4
            imageView.layer.shadowOpacity = 0.8
            imageView.layer.shadowOffset = CGSize(width: 2, height: 3)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    }
    
    private func setupContstraints() {
        view.addSubview(startButton)
        view.addSubview(scoreButton)
        view.addSubview(mainImage)
        
        let freeSpace = view.frame.height / 2 - 120
        let sizeForImage = freeSpace
        
        mainImage.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: 10).isActive = true
        mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImage.widthAnchor.constraint(equalToConstant: sizeForImage).isActive = true
        mainImage.heightAnchor.constraint(equalToConstant: sizeForImage).isActive = true
        
        startButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        startButton?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton?.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/2 - 95).isActive = true
        
        scoreButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        scoreButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        scoreButton?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoreButton?.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 20).isActive = true
    }
    
    @objc private func startButtonTapped() {
        guard let navigation = navigationController else { return }
         navigation.pushViewController(CategoryCollectionViewController(), animated: false)
    }
    
    @objc private func scoreButtonTapped() {
        guard let navigation = navigationController else { return }
        navigation.pushViewController(ScoreTableViewController(), animated: false)
    }
}
