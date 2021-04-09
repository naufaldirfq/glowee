//
//  SkinIssueDetailsTableViewController.swift
//  Glowee
//
//  Created by Michael Kam on 08/04/21.
//  Karena ternyata cuma butuh 1 storyboard, maka ini yang umumnya dipake untuk perpindahan. Code sudah mengikuti example dan tutorial tp gagal
//  Yang belum adalah: validasi data (ganti label) pas unwind, unwind juga belum, checkmark blom di hide (belum true atau false), aspek ratio gambar juga belum

import UIKit

// issues = var
// Issues = Class (liat huruf depan)
// issue = konstan untuk manggil table view di function dibawah

class Issues {
    
    //MARK: Properties
    
    var skinIssueValueSelection: String
    var skinIssueImage: UIImage?
    var skinIssueDetailsSelection: String
    var skinIssueCheckmark: UIImage?
    
    init(skinIssueValueSelection: String, skinIssueImage: UIImage?, skinIssueDetailsSelection: String, skinIssueCheckmark: UIImage?) {
        self.skinIssueValueSelection = skinIssueValueSelection
        self.skinIssueImage = skinIssueImage
        self.skinIssueDetailsSelection = skinIssueDetailsSelection
        self.skinIssueCheckmark = skinIssueCheckmark
    }
    
}

private let reuseIdentifier = "skinIssueDetails"

class SkinIssueDetailsTableViewController: UITableViewController {
    
    var issues = [Issues]()
    
    let skinType = [
        Issues(skinIssueValueSelection: "Oily", skinIssueImage: UIImage(named: "oily"), skinIssueDetailsSelection: "A", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Dry", skinIssueImage: UIImage(named: "dry"), skinIssueDetailsSelection: "B", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Combination", skinIssueImage: UIImage(named: "combination"), skinIssueDetailsSelection: "C", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Normal", skinIssueImage: UIImage(named: "normal men"), skinIssueDetailsSelection: "D", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x"))
    ]
    
    let skinIssues = [
        Issues(skinIssueValueSelection: "Acne Prone", skinIssueImage: UIImage(named: "acne"), skinIssueDetailsSelection: "Satu", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Dull Skin", skinIssueImage: UIImage(named: "dull"), skinIssueDetailsSelection: "Dua", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Comedo", skinIssueImage: UIImage(named: "comedo"), skinIssueDetailsSelection: "Tiga", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Sensitive Skin", skinIssueImage: UIImage(named: "sensitive"), skinIssueDetailsSelection: "Empat", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Excessive Dryness", skinIssueImage: UIImage(named: "excessive dry"), skinIssueDetailsSelection: "Lima", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadSampleIssues() --> dibuka kalau mau ada keluar (display) data
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getSkin(forCategory: String) -> [Issues] {
        switch forCategory {
        case "Skin Type":
            return skinType
        case "Skin Issue":
            return skinIssues
        default:
            return skinType
        }
    }

    var categoryFromSkin: String = ""  // katanya hanya untuk temp variable
    
    func initSkin(category: skinCategory) {
        issues = getSkin(forCategory: category.textKiri)
        print(issues)
        self.navigationItem.title = category.textKiri
        categoryFromSkin = category.textKiri
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return issues.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "skinIssueDetails", for: indexPath) as? SkinIssueDetailsTableViewCell
        else {
            fatalError("The dequeued cell is not an instance of SkinIssueDetailsTableViewCell")
        }
        
        let issue = issues[indexPath.row]
        
        cell.skinIssueValues.text = issue.skinIssueValueSelection
        cell.skinIssueImage.image = issue.skinIssueImage
        cell.skinIssueDetails.text = issue.skinIssueDetailsSelection
        cell.skinIssueCheckmark.image = issue.skinIssueCheckmark

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

    private func loadSampleIssues() {
        let imageIssueSatu = UIImage(named: "acne")
        let imageIssueDua = UIImage(named: "dull")
        let imageIssueTiga = UIImage(named: "comedo")
        let imageIssueEmpat = UIImage(named: "sensitive")
        let imageIssueLima = UIImage(named: "excessive dry")
        let imageCheck = UIImage(named: "QuickActions_Confirmation_2x")
        
        let issueSatu = Issues(skinIssueValueSelection: "Acne Prone", skinIssueImage: imageIssueSatu, skinIssueDetailsSelection: "ini adalah jerawat",skinIssueCheckmark: imageCheck)
        
        let issueDua = Issues(skinIssueValueSelection: "Dull Skin", skinIssueImage: imageIssueDua, skinIssueDetailsSelection: "ini adalah kusam", skinIssueCheckmark: imageCheck)
        
        let issueTiga = Issues(skinIssueValueSelection: "Comedo Prone", skinIssueImage: imageIssueTiga, skinIssueDetailsSelection: "ini komedoan", skinIssueCheckmark: imageCheck)
        
        let issueEmpat = Issues(skinIssueValueSelection: "Sensitive Skin", skinIssueImage: imageIssueEmpat, skinIssueDetailsSelection: "kulitmu sensitif", skinIssueCheckmark: imageCheck)
        
        let issueLima = Issues(skinIssueValueSelection: "Excessive Dryness", skinIssueImage: imageIssueLima, skinIssueDetailsSelection: "Kering!", skinIssueCheckmark: imageCheck)

        issues += [issueSatu, issueDua, issueTiga, issueEmpat, issueLima]
    }
    
}
