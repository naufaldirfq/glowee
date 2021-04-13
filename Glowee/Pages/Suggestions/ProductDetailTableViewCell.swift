//
//  ProductDetailTableViewCell.swift
//  Glowee
//
//  Created by Ricksen Tanata on 13/04/21.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var howToUseDescription: UILabel!
    @IBOutlet weak var ingredientsList: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
