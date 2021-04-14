//
//  IngredientsPageRevisi.swift
//  Glowee
//
//  Created by Felicia Stevanie on 09/04/21.
//

import UIKit

class IngredientsPageRevisi: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var titleIndex = [
    "fel",
    "lis",
    "wi ",
    "bu"
    ]
    
    var bodyIndex = [
    "1",
    "2",
    "3",
    "4"
    ]
    
    var productModel = [Model]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for : indexPath) as? IngredientsPageTableViewCell
            cell?.titleLabel.text = "Description: "
            cell?.bodyLabel.text = "Salicylic Acid bekerja dengan cara meningkatkan kelembaban kulit dan mempermudah proses pengelupasan sel kulit mati. "
            return cell!
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GoodFor", for: indexPath) as? IngredientsPageTableViewCell
            cell?.goodForLabel.text = "Good For: "
            cell?.name1.text = "Acne"
            cell?.name2.text = "Comedo"
            cell?.name3.text = "Hydrate"
            return cell!
            
        }
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideEffect", for: indexPath) as?
            IngredientsPageTableViewCell
            
            cell?.sideEffectLabel.text = "Side Effect: "
            cell?.sideEffectExplanationLabel.text = """
            · Iritasi, kering, atau nyeri pada kulit.
            · Gatal-gatal.
            · Kulit terasa panas, memerah, dan mengelupas.
            """
            return cell!
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Warning", for: indexPath) as?
            IngredientsPageTableViewCell
            cell?.warningLabel.text = "Warning"
            cell?.warningExplanationLabel.text = """
            1. Jangan campurkan dengan produk lain yang mengandung retinoid ataupun benzoyl peroxide.
            2. Salicylic Acid dapat terserap pada ASI.
            """
            return cell!
        }
    }
    
    func tableView(_ tableView:UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.title = "Ingridients Page"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
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
