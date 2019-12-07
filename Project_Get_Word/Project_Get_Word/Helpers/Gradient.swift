//
//  Gradient.swift
//  Project_Get_Word
//
//  Created by Давид on 29/11/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

final class GradientView: UIView {
    
    var colors: [UIColor] {
        didSet {
            setupGradient(with: colors)
        }
    }
    
    convenience init(colors: [UIColor]) {
        self.init(colors: colors, frame: .zero)
    }
    
    init(colors: [UIColor], frame: CGRect) {
        self.colors = colors
        super.init(frame: frame)
        setupGradient(with: colors)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // слои - CAlayer делаем его CAGradientLayer
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    // layer - это CAlayer и кастуем его к CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    func setupGradient(with colors: [UIColor]) {
        gradientLayer.colors = colors.compactMap { $0.cgColor }
    }
}
