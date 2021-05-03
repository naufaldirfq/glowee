//
//  skinTypeTableViewCell.swift
//  Glowee
//
//  Created by Michael Kam on 07/04/21.
//

import UIKit

class skinTypeTableViewCell: UITableViewCell {

    @IBOutlet weak public var skinType: UILabel!
    @IBOutlet weak public var skinDetails: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
