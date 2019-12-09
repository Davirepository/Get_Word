//
//  HeartStack.swift
//  Project_Get_Word
//
//  Created by Давид on 04/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

final class HeartStack: UIStackView {
    private var heartImages = [UIImageView]()
    // когда уменьшаются жизни, тогда обновляем имидж с жизнями
    var countLive = 0 {
        didSet {
            updateImageState()
        }
    }
    
    private var heartCount: Int = 6
    private let queue = DispatchQueue(label: "queue.com", attributes: .concurrent)
    
    // MARK: ...Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImages()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupImages()
    }
    
    // MARK: ...Private Methods
    private func setupImages() {
        for image in heartImages {
            removeArrangedSubview(image)   // удаление кнопки из сабвью
            image.removeFromSuperview()    // удаление из стеквью
        }
        heartImages.removeAll()   // очищение массива кнопок
        
        // Load image
        let bundle = Bundle(for: type(of: self))        // путь к assets
        let filledHeart = UIImage(named: "heart 0", in: bundle, compatibleWith: self.traitCollection) // место хранения картинки
        for _ in 0..<heartCount {                    // создание 6 сердец кнопок
            // Create the button
            let image = UIImageView()
            
            // Set image
            image.image = filledHeart
            // Add constraints
            image.layer.shadowRadius = 4
            image.layer.shadowOpacity = 0.5
            image.layer.shadowOffset = CGSize(width: -2, height: 3)
            
            // Add the image to the stack
            addArrangedSubview(image)
            
            // Add the new image in the heart image array
            heartImages.append(image)
        }
    }
    
    /// метод удаления сердец
    private func updateImageState() {
        let bundle = Bundle(for: type(of: self))
        let filledHeart = UIImage(named: "heart 0", in: bundle, compatibleWith: self.traitCollection) // место хранения картинки
        let emptyHeart = UIImage(named: "heart", in: bundle, compatibleWith: self.traitCollection)
        if countLive == 6 || countLive == 0 {
            setupImages()
        } else {
            let animatedImage = UIImage.animatedImage(with: [emptyHeart!, filledHeart!], duration: 0.3)
                heartImages[countLive].image = animatedImage
            self.superview?.isUserInteractionEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.queue.sync(flags: .barrier) {
                    self.superview?.isUserInteractionEnabled = true
                    self.heartImages[self.countLive].image = emptyHeart
                }
            }
        }
    }
    
}
