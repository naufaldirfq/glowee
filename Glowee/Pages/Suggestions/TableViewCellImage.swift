//
//  TableViewCellImage.swift
//  Glowee
//
//  Created by Mac-albert on 13/04/21.
//

import UIKit

class TableViewCellImage: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
