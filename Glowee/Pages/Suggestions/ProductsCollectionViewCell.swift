//
//  ProductsCollectionViewCell.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 09/04/21.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    
    static let identifier = "productCollectionViewCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with model: Model) {
        self.productLabel.text = model.productName
        self.productImage.image = UIImage(named: model.image)
    }

}
