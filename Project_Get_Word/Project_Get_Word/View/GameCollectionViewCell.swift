//
//  GameCollectionViewCell.swift
//  Project_Get_Word
//
//  Created by Давид on 01/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit
class GameCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "Cell"
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
      
    override init(frame: CGRect) {
        super.init(frame: frame)
        textLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        textLabel.textAlignment = .center
        textLabel.textColor = .white
        setupUI()
        contentView.addSubview(textLabel)
    }
    
    private func setupUI() {
        layer.cornerRadius = 10
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 2, height: 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
