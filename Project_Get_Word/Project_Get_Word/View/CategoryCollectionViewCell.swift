//
//  CategoryCollectionViewCell.swift
//  Project_Get_Word
//
//  Created by Давид on 05/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let reusedId = "CategoryCell"
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryLabel)
        setup()
        
        categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        layer.cornerRadius = 30
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 3)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryLabel.text = ""
    }
}
