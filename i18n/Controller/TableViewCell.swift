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
    let maxConstraint: CGFloat = 80
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let pan = UIPanGestureRecognizer(target: self, action: #selector(swipeAction(gestureRecognizer:)))
        self.addGestureRecognizer(pan)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func swipeAction(gestureRecognizer: UIGestureRecognizer) {
        if let pan = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = pan.translation(in: self).x
            if translation < 0 && moveConstraint.constant >= maxConstraint{
                // do something
                UIView.animate(withDuration: 2) {
                    self.moveConstraint.constant -= self.maxConstraint
                }
                
            }
        }
    }
}
