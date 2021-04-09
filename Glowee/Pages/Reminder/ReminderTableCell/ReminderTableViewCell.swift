//
//  ReminderTableViewCell.swift
//  Glowee
//
//  Created by Ricksen Tanata on 09/04/21.
//

import UIKit

class ReminderTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "reminderCollectionViewCell", for: indexPath)
        return cell
    }
    
    @IBOutlet var collectionview: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionview.register(ReminderCollectionViewCell.nib(), forCellWithReuseIdentifier: ReminderCollectionViewCell.identifier)
        self.collectionview.delegate = self
        self.collectionview.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
