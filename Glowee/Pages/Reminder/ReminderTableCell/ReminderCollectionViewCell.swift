//
//  ReminderCollectionViewCell.swift
//  Glowee
//
//  Created by Ricksen Tanata on 09/04/21.
//

import UIKit

class ReminderCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ReminderCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ReminderCollectionViewCell", bundle: nil)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
