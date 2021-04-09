//
//  RecommendationTableViewCell.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 08/04/21.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var products = [String] ()
    var models = [Model]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.productCollectionView.register(ProductsCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductsCollectionViewCell.identifier)
        self.productCollectionView.delegate = self
        self.productCollectionView.dataSource = self
        
        products = ["garnier", "biore", "ponds"]
        
    }
    
    func configure(with models: [Model]) {
        self.models = models
        productCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: ProductsCollectionViewCell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCollectionViewCell", for: indexPath) as? ProductsCollectionViewCell {
            cell.configure(with: models[indexPath.row])
            return cell
        }
        print("gak masuk if collection")
        return UICollectionViewCell()
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
//        let size = CGSize(width: 50, height: 50)
//        return size
//    }

}
