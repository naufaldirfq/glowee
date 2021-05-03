//
//  ReminderTableViewCell2.swift
//  Glowee
//
//  Created by Mac-albert on 12/04/21.
//

import UIKit

class ReminderTableViewCell2: UITableViewCell {


    @IBOutlet weak var imageString: UIImageView!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var ProductNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func configure(with model: Model) {
        self.brandNameLabel.text = model.brandName
        self.imageString.image = UIImage(named: model.image)
        self.ProductNameLabel.text = model.productName
    }
    


}
