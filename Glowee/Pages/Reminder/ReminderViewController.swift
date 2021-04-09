//
//  ReminderViewController.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 06/04/21.
//

import UIKit

class ReminderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.register(ReminderCollectionViewCell.nib(), forCellReuseIdentifier: ReminderCollectionViewCell.identifier)
        self.tableview.delegate = self
        self.tableview.dataSource = self
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "ReminderTableViewCell")
    let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderTableViewCell", for: indexPath)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
