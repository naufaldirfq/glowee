//
//  PreferencesViewController.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 06/04/21.
//

import UIKit

class skinCategory {
    var textKiri: String
    var textKanan: String
    
    init(textKiri: String, textKanan: String) {
        self.textKiri = textKiri
        self.textKanan = textKanan
    }
    
}

class PreferencesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // ini coba ngetes tentang double headed slider
    
    let rangeSlider = RangeSlider(frame: .zero)
    
    // ini untuk bagian table view controller
    var listCategory: [skinCategory] = []
    
    
    let firstCategory = skinCategory(textKiri: "Skin Type", textKanan: "Detail")
    let secondCategory = skinCategory(textKiri: "Skin Issue", textKanan: "None")
    
    // ini bagian IBOutlet
    @IBOutlet weak var preferenceTitleLabel: UILabel!
    
    @IBOutlet weak var biodataLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var skinTypeAndIssueLabel: UILabel!
    
    @IBOutlet weak var skinTypeAndIssueTable: UITableView!
    
    @IBOutlet weak var budgetProductLabel: UILabel!
    
    @IBOutlet weak var minBudgetLabel: UILabel!
    @IBOutlet weak var maxBudgetLabel: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // bagian double headed slider
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged(_:)),
                              for: .valueChanged)
        
        
        //bagian untuk nambah array biar bisa ditulis
        
        //apakah harus ada append?
        listCategory.append(firstCategory)
        listCategory.append(secondCategory)
        
        
        //bagian double headed slider
        view.addSubview(rangeSlider)
    }
    
    //dibawah ini untuk pertabelan duniawi
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "skinTypeCell", for: indexPath) as? skinTypeTableViewCell
        
        cell?.skinType.text = listCategory[indexPath.row].textKiri
        cell?.skinIssue.text = listCategory[indexPath.row].textKanan
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = listCategory[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "skinIssueDetails", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as? SkinIssueDetailsTableViewController
        
        nextView?.initSkin(category: (sender as? skinCategory)!)
        
    }
    
    
    //dibawah ini untuk double headed slider duniawi
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20
        let width = view.bounds.width - 2 * margin
        let height: CGFloat = 5
        
        rangeSlider.frame = CGRect(x: 15, y: 442, width: width, height: height)
//        rangeSlider.center = view.center
    }

    @objc func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
      let minValues = "\(rangeSlider.lowerValue * 1_000_000)"
      let maxValues = "\(rangeSlider.upperValue * 1_000_000)" // kalo pake kayak gini, takutnya terlalu kecil valuenya dan susah approval logicnya
      print("Range slider value changed: \(minValues), \(maxValues)")
      
        let fixMinValue = String(format: "%.2f", minValues)
        
      minBudgetLabel.text = "Min: Rp \(fixMinValue)"
    
      maxBudgetLabel.text = "Max: Rp \(maxValues)"
        
        //minBudgetLabel.text = "\(String(format: "%.2f", minValues))"
    }
    
    
    
}


