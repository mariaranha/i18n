//
//  TableViewCell.swift
//  i18n
//
//  Created by Marina Miranda Aranha on 24/01/20.
//  Copyright © 2020 Marina Miranda Aranha. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var didSelectImage: UIImageView!
    @IBOutlet weak var moveConstraint: NSLayoutConstraint!
    let defaultConstraint: CGFloat = -24
    let maxConstraint: CGFloat = 120
    var animationStart = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let pan = UIPanGestureRecognizer(target: self, action: #selector(swipeAction(gestureRecognizer:)))
        pan.delegate = self
        self.addGestureRecognizer(pan)
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = panGestureRecognizer.translation(in: self).x
            return translation < 0
        } else {
            return false
        }
    }
    
    @objc func swipeAction(gestureRecognizer: UIPanGestureRecognizer) {
        
        
        
        if gestureRecognizer.state == .changed {
            let translation = abs(gestureRecognizer.translation(in: self).x)
            UIView.animate(withDuration: 01, delay: 0, options: .allowUserInteraction, animations: {
                if self.shouldMove(translation: translation) {
                    self.moveConstraint.constant += translation
                }
                
                self.layoutIfNeeded()
            })
          
        } else if gestureRecognizer.state == .ended {
            if self.shouldGoBack() {
                self.moveConstraint.constant = self.defaultConstraint
                self.layoutIfNeeded()
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.moveConstraint.constant = self.maxConstraint
                    self.layoutIfNeeded()
                })
            }
        }
    }
    
    func shouldMove(translation: CGFloat) -> Bool {
        return (abs(translation) + self.moveConstraint.constant < self.maxConstraint)
    }
    
    func shouldGoBack() -> Bool {
        return self.moveConstraint.constant < (maxConstraint/2)
    }
   
}
