//
//  OpeningTableViewCell.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 13/04/21.
//

import UIKit

class OpeningTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ingredients1Button: UIButton!
    @IBOutlet weak var ingredients2Button: UIButton!
    @IBOutlet weak var ingredients3Button: UIButton!
    @IBOutlet weak var ingredients4Button: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
