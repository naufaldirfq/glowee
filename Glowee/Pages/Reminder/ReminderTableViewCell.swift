//
//  ReminderTableViewCell.swift
//  Glowee
//
//  Created by Mac-albert on 11/04/21.
//

import UIKit

class ReminderTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ReminderTableViewCell2
        
        cell?.configure(with: models[indexPath.row])
        tableView.separatorStyle = .none
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
        return 100
        
    }
}
