//
//  ReminderCollectionViewCell.swift
//  Glowee
//
//  Created by Ricksen Tanata on 09/04/21.
//

import UIKit

class ReminderCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "reminderCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "reminderCollectionViewCell", bundle: nil)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
