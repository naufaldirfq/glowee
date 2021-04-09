//
//  SkinIssueDetailsTableViewCell.swift
//  Glowee
//
//  Created by Michael Kam on 08/04/21.
//

import UIKit

class SkinIssueDetailsTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var skinIssueValues: UILabel!
    @IBOutlet weak var skinIssueCheckmark: UIImageView!
    @IBOutlet weak var skinIssueImage: UIImageView!
    @IBOutlet weak var skinIssueDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
