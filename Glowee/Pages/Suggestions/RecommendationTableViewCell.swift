//
//  RecommendationTableViewCell.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 08/04/21.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var recommendationLabel: UILabel!
    @IBOutlet weak var yourRecommendationLabel: UILabel!
    
    var models = [Model]()
    
    static let identifier = "recommendationTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.productCollectionView.delegate = self
        self.productCollectionView.dataSource = self
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: ProductsCollectionViewCell = productCollectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier, for: indexPath) as? ProductsCollectionViewCell {
            cell.configure(with: models[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
        
    }

}
