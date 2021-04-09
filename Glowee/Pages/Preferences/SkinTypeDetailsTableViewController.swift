//
//  SkinTypeDetailsTableViewController.swift
//  Glowee
//
//  Created by Michael Kam on 07/04/21.
//

import UIKit

class skinTypeCells {
    
    //MARK: Properties
    
    var skinTypeValueSelection: String
    var skinTypeImageSelection: UIImage?
    var skinTypeDetailsSelection: String
    var skinTypeCheckmarkImage: UIImage?
    
    init(skinTypeValueSelection: String, skinTypeImageSelection: UIImage?, skinTypeDetailsSelection: String, skinTypeCheckmarkImage: UIImage?) {
        self.skinTypeValueSelection = skinTypeValueSelection
        self.skinTypeImageSelection = skinTypeImageSelection
        self.skinTypeDetailsSelection = skinTypeDetailsSelection
        self.skinTypeCheckmarkImage = skinTypeCheckmarkImage
    }
}

class SkinTypeDetailsTableViewController: UITableViewController {
    
    var listOfSkin = [skinTypeCells]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleSkinTypes()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfSkin.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "skinTypeDetails", for: indexPath) as? SkinTypeDetailsTableViewCell
        else {
            fatalError("The dequeued cell is not an instance of SkinTypeDetailsTableViewCell.")
        }

        let listSkin = listOfSkin[indexPath.row]
        
        cell.skinTypeValue.text = listSkin.skinTypeValueSelection
        cell.skinTypeImage.image = listSkin.skinTypeImageSelection
        cell.skinTypeDetails.text = listSkin.skinTypeDetailsSelection
        cell.skinTypeCheckmark.image = listSkin.skinTypeCheckmarkImage
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func loadSampleSkinTypes() {
        let imageTypeSatu = UIImage(named: "oily")
        let imageTypeDua = UIImage(named: "dry")
        let imageTypeTiga = UIImage(named: "combination")
        let imageTypeEmpat = UIImage(named: "normal men")
        let imageTypeCheckmark = UIImage(named: "QuickActions_Confirmation_2x")

        let typeSatu = skinTypeCells(skinTypeValueSelection: "Oily", skinTypeImageSelection: imageTypeSatu, skinTypeDetailsSelection: "Oily skin is indicated with excess oil on the face that produces a persistently shiny or greasy appearance. Select this option if you have enlarged pores, blackheads or whiteheads, and frequent pimples or acne problems.", skinTypeCheckmarkImage: imageTypeCheckmark)
        
        let typeDua = skinTypeCells(skinTypeValueSelection: "Dry", skinTypeImageSelection: imageTypeDua, skinTypeDetailsSelection: "Dry skin is indicated with visible cracking or peeling skin. Excessive dryness can make skin looks rough and scaly. Select this option if your skin pores are almost invisible, your facial skin doesn’t feel elastic, and sometimes redness skin occurs.", skinTypeCheckmarkImage: imageTypeCheckmark)
        
        let typeTiga = skinTypeCells(skinTypeValueSelection: "Combination", skinTypeImageSelection: imageTypeTiga, skinTypeDetailsSelection: "Combination skin is indicated with mixed indicators from oily skin and dry skin. Example of combination skin is you have some visible pores and greasy feel in certain area on your facial skin, but feels dry on the other. Select this option if you experienced the case above.", skinTypeCheckmarkImage: imageTypeCheckmark)
        
        let typeEmpat = skinTypeCells(skinTypeValueSelection: "Normal", skinTypeImageSelection: imageTypeEmpat, skinTypeDetailsSelection: "Normal skin is the best balance skin type, it is not too oily and not too dry. There are only minor imperfections, no severe sensitivity, and barely visible pores. Select this option if you don’t experienced any major imperfections on your skin.", skinTypeCheckmarkImage: imageTypeCheckmark)
        
        listOfSkin += [typeSatu, typeDua, typeTiga, typeEmpat]
        
    }
    
    
}
