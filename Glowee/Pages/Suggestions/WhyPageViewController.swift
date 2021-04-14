//
//  WhyPageViewController.swift
//  Glowee
//
//  Created by Mac-albert on 13/04/21.
//

import UIKit

class WhyPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    var questionIndex = [
        "What is it? (Rencana mau dibuat kayak ingredients)",
        "Effects when I use unsuitable cleanser?",
        "Cleanser Types:",
        "Recommended Usages:"
    ]
    
    var answerIndex = [
        "Cleanser merupakan tahapan paling pertama dalam penggunaan produk perawatan wajah. Cleanser berfungsi untuk membersihkan wajah dari berbagai kotoran dan minyak yang menempel di wajah.",
        "Cleanser merupakan tahapan paling pertama dalam penggunaan produk perawatan wajah. Cleanser berfungsi untuk membersihkan wajah dari berbagai kotoran dan minyak yang menempel di wajah.",
        "Cleanser merupakan tahapan paling pertama dalam penggunaan produk perawatan wajah. Cleanser berfungsi untuk membersihkan wajah dari berbagai kotoran dan minyak yang menempel di wajah.",
        "Cleanser merupakan tahapan paling pertama dalam penggunaan produk perawatan wajah. Cleanser berfungsi untuk membersihkan wajah dari berbagai kotoran dan minyak yang menempel di wajah."
    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? WhyPageTableViewCell
        
        cell?.questionLabel.text = questionIndex[indexPath.row]
        cell?.answerLabel.text = answerIndex[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView:UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
