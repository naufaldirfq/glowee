//
//  SkinTypeDetailsTableViewCell.swift
//  Glowee
//
//  Created by Michael Kam on 07/04/21.
//

import UIKit

class SkinTypeDetailsTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var skinTypeValue: UILabel!
    @IBOutlet weak var skinTypeImage: UIImageView!
    @IBOutlet weak var skinTypeDetails: UILabel!
    @IBOutlet weak var skinTypeCheckmark: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
