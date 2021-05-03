//
//  ProductDetail.swift
//  Glowee
//
//  Created by Ricksen Tanata on 12/04/21.
//

import UIKit

class ProductDetailViewController: UIViewController{
    
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ProductDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me")
    }
    
}

extension ProductDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        self.productBrand.text = "Ricksen Wibu"
        if indexPath.row == 0{

            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BrandButtonCell", for: indexPath) as? ProductDetailTableViewCell
                cell?.productBrand.text = "Cosrx"
            return cell!
        } else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NamePriceCell", for: indexPath) as?
                ProductDetailTableViewCell; cell?.productName.text = "Aloe Soothing Sun Cream SPF 50+ PA+++"
                    .self;cell?.productPrice.text = "Rp.50,000"
            return cell!
        } else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as?ProductDetailTableViewCell;cell?.productDescription.text = "Smooth and moisturizing sunscreen with 5,500ppm of Aloe Barbadensis Leaf Water provides moisture and nutrients to the skin while protecting the skin from exposure to UVA and UVB rays. Aloe Soothing Sun Cream is a mixture of natural ingredients and UV protection ingredients that have been tested scientifically."
            return cell!
        } else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HowToUseCell", for: indexPath)as? ProductDetailTableViewCell;cell?.howToUseDescription.text="Apply to the area exposed to the sun, use 30 minutes before doing outdoor activities. Reapply if needed, especially if exposed to continuous sunlight throughout the day."
            return cell!
        } else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WhereToFindCell", for: indexPath)
            return cell
        }else if indexPath.row == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsCell", for: indexPath)as? ProductDetailTableViewCell;cell?.ingredientsList.text = "Water, Ethylhexyl Methoxycinnamate, Glycerin, Propylene Glycol, Cyclopentasiloxane, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Phenylbenzimidazole Sulfonic Acid, Dicaprylyl Carbonate, Isoamyl p-Methoxycinnamate, Potassium Cetyl Phosphate, Alcohol, Dimethicone, Glyceryl Stearate, Butylene Glycol, Titanium Dioxide, C14-22 Alcohols, Polymethyl Methacrylate, Cetearyl Alcohol, PEG-100 Stearate, Triethanolamine, Silica, Sodium Hydroxide, C12-20 Alkyl Glucoside, Dimethicone/Vinyl Dimethicone Crosspolymer, Aluminum Hydroxide, Stearic Acid, Fragrance, Caprylyl Glycol, Phenoxyethanol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Aloe Arborescens Leaf Extract, Dipotassium Glycyrrhizate, Carbomer, Xanthan Gum, Tocopheryl Acetate, Disodium EDTA"
            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 350
        }else if indexPath.row == 1{
            return 60
        }else if indexPath.row == 2{
            return 60
        }else if indexPath.row == 3{
            return 250
        }else if indexPath.row == 4{
            return 150
        }else if indexPath.row == 5{
            return 200
        }else if indexPath.row == 6{
            return 300
        }else{
            return 60
        }
    }
    
}
