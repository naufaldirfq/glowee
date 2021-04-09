//
//  OnBoarding2ViewController.swift
//  Glowee
//
//  Created by Mac-albert on 09/04/21.
//

import UIKit

class OnBoarding2ViewController: UIViewController {

    @IBOutlet var swipeScreen: UIView!
    @IBOutlet weak var btnLetsBegin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLetsBegin.layer.cornerRadius = 10
        btnLetsBegin.clipsToBounds = true
        let rightswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeByUser(_ :)))
        rightswipeGesture.direction = .right
        self.view.addGestureRecognizer(rightswipeGesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func rightSwipeByUser (_ gesture:UISwipeGestureRecognizer){
        performSegue(withIdentifier: "OnBoarding1", sender: self.swipeScreen)
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
