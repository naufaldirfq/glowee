//
//  ReminderTableViewCell.swift
//  Glowee
//
//  Created by Mac-albert on 11/04/21.
//

import UIKit

class ReminderTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource{
    let brandName = [
        "COSRX",
        "Nivea",
        "Biore"
    ]
    
    let productName = [
        "Product 1",
        "Product 2",
        "Product 3"
    ]
    
//    let imageName:[UII] = [
//        "Product 1",
//        "Product 2",
//        "Product 3",
//    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ReminderTableViewCell2
        
        
//        cell?.imageString.text = imageName[indexPath.row]
//        cell?.brandNameLabel.text = brandName[indexPath.row]
//        cell?.ProductNameLabel.text = productName[indexPath.row]
        cell?.configure(with: models[indexPath.row])
        return cell!
    }
    
    var models = [Model]()
    
    func configure(with models: [Model]) {
        self.models = models
        tableViewProduct.reloadData()
    }
    
    
    
    
    
    @IBOutlet weak var tableViewProduct: UITableView!
    @IBOutlet weak var timeRoutineLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tableViewProduct.delegate = self
        self.tableViewProduct.dataSource = self
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func tableView(_ tableView:UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
}
