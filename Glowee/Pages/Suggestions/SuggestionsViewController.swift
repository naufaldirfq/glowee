//
//  SuggestionsViewController.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 06/04/21.
//

import UIKit

class SuggestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var suggestionTableView: UITableView!
    @IBOutlet weak var ingredients1Button: UIButton!
    @IBOutlet weak var ingredients2Button: UIButton!
    @IBOutlet weak var ingredients3Button: UIButton!
    @IBOutlet weak var ingredients4Button: UIButton!
    
    let recommendations = ["Cleanser", "Sunscreen", "Moisturizer"]
    var productModel = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        initModels()
        // Do any additional setup after loading the view.
    }
    
    func initTableView() {
        self.suggestionTableView.delegate = self
        self.suggestionTableView.dataSource = self
    }
    
    func initModels() {
        productModel.append(Model(productName: "Garnier", image: "cleanser_1"))
        productModel.append(Model(productName: "Clean&Clear", image: "cleanser_2"))
        productModel.append(Model(productName: "Senka", image: "cleanser_3"))
        productModel.append(Model(productName: "Garnier", image: "cleanser_1"))
        productModel.append(Model(productName: "Clean&Clear", image: "cleanser_2"))
        productModel.append(Model(productName: "Senka", image: "cleanser_3"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: RecommendationTableViewCell.identifier, for: indexPath) as? RecommendationTableViewCell {
            cell.configure(with: productModel)
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        recommendations.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return recommendations[section]
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
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
