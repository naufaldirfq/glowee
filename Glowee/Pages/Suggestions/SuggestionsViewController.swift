//
//  SuggestionsViewController.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 06/04/21.
//

import UIKit

class SuggestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var suggestionTableView: UITableView!
    let recommendations = ["", "Cleanser", "Sunscreen", "Moisturizer"]
    var cleanserModel = [Model]()
    var moisturizerModel = [Model]()
    var sunscreenModel = [Model]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initMoisturizerModels()
        initSunscreenModels()
        initCleanserModels()
        // Do any additional setup after loading the view.
    }
    
    func initView() {
        self.suggestionTableView.delegate = self
        self.suggestionTableView.dataSource = self

    }
    
    func initCleanserModels() {
        cleanserModel.append(Model(productName: "Clean&Clear", image: "cleanser_2", brandName: " "))
        cleanserModel.append(Model(productName: "Senka", image: "cleanser_3", brandName: " "))
        cleanserModel.append(Model(productName: "Garnier", image: "cleanser_1", brandName: " "))
        cleanserModel.append(Model(productName: "Innisfree", image: "cleanser_innisfree", brandName: " "))
        cleanserModel.append(Model(productName: "Cetaphil", image: "cleanser_cetaphil", brandName: " "))
    }
    
    func initMoisturizerModels() {
        moisturizerModel.append(Model(productName: "Laneige", image: "moist_laneige", brandName: " "))
        moisturizerModel.append(Model(productName: "Cerave", image: "moist_cerave", brandName: " "))
        moisturizerModel.append(Model(productName: "Hada Labo", image: "moist_hadalabo", brandName: " "))
        moisturizerModel.append(Model(productName: "Safi", image: "moist_safi", brandName: " "))
    }
    
    func initSunscreenModels() {
        sunscreenModel.append(Model(productName: "Cosrx", image: "CosrxAloeSoothingSunScreen", brandName: " "))
        sunscreenModel.append(Model(productName: "Rose All Day", image: "sunscreen_roseallday", brandName: " "))
        sunscreenModel.append(Model(productName: "Emina", image: "sunscreen_emina", brandName: " "))
        sunscreenModel.append(Model(productName: "Lacoco", image: "sunscreen_lacoco", brandName: " "))
        sunscreenModel.append(Model(productName: "Wardah", image: "sunscreen_wardah", brandName: " "))
        sunscreenModel.append(Model(productName: "Klairs", image: "sunscreen_klairs", brandName: " "))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recommendations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "yourRecommendationTableViewCell", for: indexPath) as? OpeningTableViewCell
            cell?.ingredients1Button.setTitle("Benzoyl Peroxide", for: .normal)
            cell?.ingredients2Button.setTitle("Salicylic Acid", for: .normal)
            cell?.ingredients3Button.setTitle("Alpha-hydroxy Acids", for: .normal)
            cell?.ingredients4Button.setTitle("Benzoyl Peroxide", for: .normal)
            cell?.ingredients1Button.layer.cornerRadius = 10
            cell?.ingredients2Button.layer.cornerRadius = 10
            cell?.ingredients3Button.layer.cornerRadius = 10
            cell?.ingredients4Button.layer.cornerRadius = 10
            return cell!
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: RecommendationTableViewCell.identifier, for: indexPath) as? RecommendationTableViewCell
            if indexPath.row != 1 {
                cell?.yourRecommendationLabel.isHidden = true
            }
            if indexPath.row == 1 {
                cell?.configure(with: cleanserModel)
            } else if indexPath.row == 2 {
                cell?.configure(with: sunscreenModel)
            } else if indexPath.row == 3 {
                cell?.configure(with: moisturizerModel)
            }
            
            cell?.recommendationLabel.text = recommendations[indexPath.row]
            return cell!
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        } else {
            return 200
        }
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
