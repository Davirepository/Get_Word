//
//  ScoreTVCDatasource.swift
//  Project_Get_Word
//
//  Created by Давид on 06/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit


extension ScoreTableViewController {
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allScores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if indexPath.row == 0 {
            cell.mainImage.image = UIImage(named: "goldcup")
            configure(cell, with: indexPath)
            return cell
        } else if indexPath.row == 1 {
            cell.mainImage.image = UIImage(named: "silvercup")
            configure(cell, with: indexPath)
            return cell
        } else if indexPath.row == 2 {
            cell.mainImage.image = UIImage(named: "milk")
            configure(cell, with: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellLabels", for: indexPath) as! ScoreTableViewCellLabels
            cell.number.text = "\(indexPath.row + 1)."
            cell.titleText.text = "\(allScores[indexPath.row].score)"
            cell.isUserInteractionEnabled = false
            return cell
        }
    }
}
