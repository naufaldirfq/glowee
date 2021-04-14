//
//  ReminderViewController.swift
//  Glowee
//
//  Created by Mac-albert on 11/04/21.
//

import UIKit

class ReminderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initModels()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    var productModel = [Model]()
    
    func initModels() {
        productModel.append(Model(productName: "Cosrx Aloe Soothing Sun Cream SPF 50+ PA+++", image: "CosrxAloeSoothingSunScreen", brandName: "Cosrx"))
    }
    
    
    var timeRoutineIndex = [
        "Morning",
        "Afternoon",
        "Evening"
    ]

    var actualTime = [
        "07.00",
        "13.00",
        "20.00"
    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ReminderTableViewCell", for: indexPath) as? ReminderTableViewCell
        cell?.timeRoutineLabel.text = timeRoutineIndex[indexPath.row]
        cell?.timeLabel.text = actualTime[indexPath.row]
        
        cell?.configure(with: productModel)
        return cell!
    }
    
    func tableView(_ tableView:UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
        
    }

    
}
