//
//  IngredientsPageTableViewCell.swift
//  Glowee
//
//  Created by Mac-albert on 13/04/21.
//

import UIKit

class IngredientsPageTableViewCell: UITableViewCell{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var goodForLabel: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var sideEffectLabel: UILabel!
    @IBOutlet weak var sideEffectExplanationLabel: UILabel!
    @IBOutlet weak var warningExplanationLabel: UILabel!
//    @IBOutlet weak var goodForCollectionCell: UICollectionView!
    @IBOutlet weak var image1 : UIImageView!
    @IBOutlet weak var image2 : UIImageView!
    @IBOutlet weak var image3 : UIImageView!
    @IBOutlet weak var name1 : UILabel!
    @IBOutlet weak var name2 : UILabel!
    @IBOutlet weak var name3 : UILabel!
//    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        goodForCollectionCell.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "issueCollectionViewCell")
//        goodForCollectionCell.delegate = self
//        goodForCollectionCell.dataSource = self
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = goodForCollectionCell.dequeueReusableCell(withReuseIdentifier: "issueCollectionViewCell", for: indexPath) as? IssueCollectionViewCell
//
//        cell?.nameIssueLabel.text = "Acne"
//
//
//
//        return cell!
//    }
//
    
}
