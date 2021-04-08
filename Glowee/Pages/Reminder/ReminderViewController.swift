//
//  ReminderViewController.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 06/04/21.
//

import UIKit

class ReminderViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    let names = ["Bambang","Sudirman", "Joko"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
 

}

extension ReminderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You Tapped Me")
    }
}

extension ReminderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Hello Pemirsa"
        
        return cell
    }
    
}
