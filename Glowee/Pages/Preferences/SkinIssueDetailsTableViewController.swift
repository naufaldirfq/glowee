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

protocol receiveData: class {
    func passDataBack(data: Issues)
}

class Issues {
    
    //MARK: Properties
    
    var skinIssueValueSelection: String
    var skinIssueImage: UIImage?
    var skinIssueDetailsSelection: String
    var skinIssueCheckmark: UIImage?
    var statusCheckmarkHidden: Bool?
    var isIssue: Bool?
    
    init(skinIssueValueSelection: String, skinIssueImage: UIImage?, skinIssueDetailsSelection: String, skinIssueCheckmark: UIImage?) {
        self.skinIssueValueSelection = skinIssueValueSelection
        self.skinIssueImage = skinIssueImage
        self.skinIssueDetailsSelection = skinIssueDetailsSelection
        self.skinIssueCheckmark = skinIssueCheckmark
        self.statusCheckmarkHidden = true
        self.isIssue = false
    }
    
}

class SkinType {
    
    var skinTypeValueSelection: String
    var skinTypeImage: UIImage?
    var skinTypeDetailsSelection: String
    var skinTypeCheckmark: UIImage?
    var statusTypeCheckmarkHidden: Bool?
    
    init(skinIssueValueSelection: String, skinIssueImage: UIImage?, skinIssueDetailsSelection: String, skinIssueCheckmark: UIImage?) {
        self.skinTypeValueSelection = skinIssueValueSelection
        self.skinTypeImage = skinIssueImage
        self.skinTypeDetailsSelection = skinIssueDetailsSelection
        self.skinTypeCheckmark = skinIssueCheckmark
        self.statusTypeCheckmarkHidden = true
    }
}

private let reuseIdentifier = "skinIssueDetails"

class SkinIssueDetailsTableViewController: UITableViewController {
    
    //untuk Passing Data Balik
    //var delegate:receiveData?
    //var data = ""
    
    weak var delegate: receiveData? //delegate ini bisa dibilang sebagai pintu untuk akses protocol dsbnya, kalau file lain mau akses, harus ada delegate juga
    
    //untuk load table
    var issues = [Issues]()
    var types = [SkinType]()
    var skinCategories = ""
    
    var selectedIndex = 0   //biar tau kepilih yang mana indexnya
    
    let imageCheckmark = UIImage(named: "QuickActions_Confirmation_2x")
    
    let skinTypes = [
        Issues(skinIssueValueSelection: "Oily", skinIssueImage: UIImage(named: "oily"), skinIssueDetailsSelection: "Oily skin is indicated with excess oil on the face that produces a persistently shiny or greasy appearance. Select this option if you have enlarged pores, blackheads or whiteheads, and frequent pimples or acne problems.", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")), //disini buat object untuk jadiin ishidden = true atau false, nanti ini disambungin ke bawah
        Issues(skinIssueValueSelection: "Dry", skinIssueImage: UIImage(named: "dry"), skinIssueDetailsSelection: "Dry skin is indicated with visible cracking or peeling skin. Excessive dryness can make skin looks rough and scaly. Select this option if your skin pores are almost invisible, your facial skin doesn’t feel elastic, and sometimes redness skin occurs.", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Combination", skinIssueImage: UIImage(named: "combination"), skinIssueDetailsSelection: "Combination skin combines indicator from dry and oily skin. Example of combination skin is you have some visible pores and greasy feel in certain area on your facial skin, but feels dry on the other. Select this option if you experienced the case above.", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Normal", skinIssueImage: UIImage(named: "normal men"), skinIssueDetailsSelection: "Normal skin is the best balance skin type, it is not too oily and not too dry. There are only minor imperfections, no severe sensitivity, and barely visible pores. Select this option if you don’t experienced any major imperfections on your skin.", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x"))
    ]
    
    // di dalem sini masukkin properties flagging. berlaku juga untuk di atas
    let skinIssues = [
        Issues(skinIssueValueSelection: "Acne Prone", skinIssueImage: UIImage(named: "acne"), skinIssueDetailsSelection: "Acne is a non-contagious skin condition characterized by pimples caused by inflamed and infected sebaceous glands. Acne typically appears on the face, neck, shoulders, chest and back and ranges in severity.", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Dull Skin", skinIssueImage: UIImage(named: "dull"), skinIssueDetailsSelection: "Dull skin tone is a result of excess dead skin cells that build up on the surface of the skin. Your skin can lose its natural luminosity because of dryness, damaged cells or slow cell turnover, all of which can happen at any age and in any season.", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Comedo", skinIssueImage: UIImage(named: "comedo"), skinIssueDetailsSelection: "A comedo is a clogged hair follicle (pore) in the skin. Keratin (skin debris) combines with oil to block the follicle. A comedo can be open (blackhead) or closed by skin (whitehead) and occur with or without acne.", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Sensitive Skin", skinIssueImage: UIImage(named: "sensitive"), skinIssueDetailsSelection: "Sensitive skin is skin that is easily irritated by different factors, that are generally tolerated by well-balanced skin, such as skin care products or high and low temperatures.", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x")),
        Issues(skinIssueValueSelection: "Excessive Dryness", skinIssueImage: UIImage(named: "excessive dry"), skinIssueDetailsSelection: "Dry skin is an uncomfortable condition marked by scaling, itching, and cracking. It can occur for a variety of reasons.", skinIssueCheckmark: UIImage(named: "QuickActions_Confirmation_2x"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Untuk userdefault
        let defaults = UserDefaults.standard
        
        let skinTypeArray = ["Oily", "Dry", "Combination", "Normal"]
        defaults.set(skinTypeArray, forKey: "SavedSkinType")
        
        let skinIssueArray = ["Acne Prone", "Dull Skin", "Comedo", "Sensitive Skin", "Excessive Dryness"]
        defaults.set(skinIssueArray, forKey: "SavedSkinIssue")
        
        //loadSampleIssues() --> dibuka kalau mau ada keluar (display) data
        
        // untuk passing data balik
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // ini yang dipake juga untuk balik ke preferences page dari skin issues dan type.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.delegate?.passDataBack(data: issues[selectedIndex])
    }
    
    func getSkin(forCategory: String) -> [Issues] {
        switch forCategory {
        case "Skin Type":
            return skinTypes
        case "Skin Issue":
            return skinIssues
        default:
            return skinTypes
        }
    }

    var categoryFromSkin: String = ""  // katanya hanya untuk temp variable
    
    func initSkin(category: skinCategory) {
        issues = getSkin(forCategory: category.textKiri)
        skinCategories = category.textKiri
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
    
    // (Ko David) didalam cell for row, buat conditional statement untuk nentuin properties flagging hidden true false nya
    // (Viona) cellForRowAt itu untuk define cellnya, mau ada apa aja di dalam sel tersebut
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
        
        // untuk umpetin gambar sudah siap. ini pakai statuscheckmark hidden mksdnya dia true hidden gitu
        cell.skinIssueCheckmark.isHidden = issue.statusCheckmarkHidden!
        
        return cell
    }
    
    
    //nanti pas di klik, kalau mau centangnya hilang, object isHiddennya dipanggil disini. Tapi manggilnya, harus membuat object isHiddennya berubah, jadi biar bisa kepanggil checkmarknya. (yang ada array di atas (skinTypes dan skinIssues))
    
    // didSelectRowAt itu untuk menentukan behavior dari cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        
        let issue = issues[indexPath.row]
        
        issue.statusCheckmarkHidden = !(issue.statusCheckmarkHidden ?? true) // tanda ! didepan kurung itu untuk inverse bool value, dan ?? true maksudnya kalau ternyata ada kemungkinan nilai nil, dibalikkin ke defaultnya adalah true. (kalau true artinya hidden)
        if skinCategories == "Skin Type" {
            issue.isIssue = false
        } else if skinCategories == "Skin Issue" {
            issue.isIssue = true
        }
        
        
        tableView.reloadData()
        
       // self.navigationController?.popViewController(animated: true)
        
        
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

  /*
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
    */
    
}

// kata kak zein yang dibawah ini ga perlu. Unwindnya kak zein pake di didSelectRow yang method navigation controller, yang ada pop view pop view itu.
extension PreferencesViewController {
    @IBAction func unwindWithSelectedSkinValue(segue: UIStoryboardSegue) {
        
    }
}

// PlayerDetailsViewController dari raywenderleich = PreferencesViewController disini
