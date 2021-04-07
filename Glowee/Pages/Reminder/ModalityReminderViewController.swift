//
//  ModalityReminderViewController.swift
//  Glowee
//
//  Created by Mac-albert on 06/04/21.
//

import UIKit

class ModalityReminderViewController: UIViewController {

    @IBOutlet weak var reminderTableView: UITableView!
    
    let names = [
        "Every Morning (07.00 AM)",
        "Every Afternoon (13.00 PM)",
        "Every Evening (20.00 PM)"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reminderTableView.delegate = self
        reminderTableView.dataSource = self

        
        // Do any additional setup after loading the view.
    }
     
}

extension ModalityReminderViewController:  UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me")
    }
}

extension ModalityReminderViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    @objc func switchDidChange(_ sender: UISwitch){
        print ("sender is \(sender.tag)")
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.reminderTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let cell = reminderTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        
        cell.textLabel?.text = names[indexPath.row]
        
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchDidChange(_:)), for: .valueChanged)
        cell.accessoryView = switchView
         
        return cell
        
    }
      
}
