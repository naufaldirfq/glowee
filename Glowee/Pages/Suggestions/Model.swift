//
//  Model.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 08/04/21.
//

import Foundation

struct Model {
    let productName: String
    let image: String
    let brandName: String
    
    init(productName: String, image: String, brandName: String) {
        self.productName = productName
        self.image = image
        self.brandName = brandName
    }
}
