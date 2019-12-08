//
//  ScoreTableViewCellLabels.swift
//  Project_Get_Word
//
//  Created by Давид on 08/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

final class ScoreTableViewCellLabels: UITableViewCell {
    static let reusedId = "TableViewCellLabels"
    
    let titleText: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.shadowRadius = 4
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 2, height: 3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let number: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.shadowRadius = 4
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 2, height: 3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(number)
        addSubview(titleText)
        
        number.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        number.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        number.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        number.heightAnchor.constraint(equalToConstant: 50).isActive = true
        number.widthAnchor.constraint(equalTo: number.heightAnchor).isActive = true
        
        titleText.leadingAnchor.constraint(equalTo: number.trailingAnchor, constant: 15).isActive = true
        titleText.widthAnchor.constraint(equalToConstant: frame.width - 10).isActive = true
        titleText.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        number.text = nil
        titleText.text = nil
    }
}
