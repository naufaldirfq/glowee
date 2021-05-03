//
//  OnboardingViewController.swift
//  Glowee
//
//  Created by Naufaldi Athallah Rifqi on 06/04/21.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet var swipeScreen: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeByUser(_ :)))
        leftswipeGesture.direction = .left
        self.view.addGestureRecognizer(leftswipeGesture)
    }
    
    @objc func leftSwipeByUser (_ gesture:UISwipeGestureRecognizer){
            performSegue(withIdentifier: "OnBoarding2", sender: self.swipeScreen)
        }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    */
