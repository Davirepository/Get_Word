//
//  ScoreTableViewController.swift
//  Project_Get_Word
//
//  Created by Давид on 06/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class ScoreTableViewController: UITableViewController {
    
    var allScores = [Score]()
    private let coreDataService = CoreDataService()
    
    private lazy var deleteBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteBarButtonTapped))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reusedId)
        navigationController?.isNavigationBarHidden = false
        navigationItem.rightBarButtonItem = deleteBarButtonItem
        navigationItem.title = "Таблица рекордов"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.backgroundColor = #colorLiteral(red: 0.9142681856, green: 0.9142681856, blue: 0.9142681856, alpha: 1)
        tableView.separatorInset.left = CGFloat(10)
        tableView.separatorInset.right = CGFloat(10)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        getScoreFromStorage()
    }

    private func getScoreFromStorage() {
        coreDataService.loadFromStorage { (score) in
            score.forEach {
                let score = Score(score: $0.score)
                self.allScores.append(score)
            }
        }
    }
    
    func configure(_ cell: TableViewCell, with indexPath: IndexPath ) {
        cell.titleText.text = "\(allScores[indexPath.row].score)"
        cell.isUserInteractionEnabled = false
    }
    
    @objc func deleteBarButtonTapped() {
        coreDataService.deleteData()
        allScores = []
        tableView.reloadData()
    }
}


