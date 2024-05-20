//
//  StartingVC.swift
//  Sample_Project_2
//
//  Created by Trenser-01 on 23/04/24.
//

import UIKit
import Foundation


enum viewcontrollers : String {
case LoginVC = "LoginVC"
case RegisterPageVC = "RegisterPageVC"
case HomeVC = "HomeVC"
    case StartingVC = "StartingVC"
}

class StartingVC: UIViewController {

    @IBOutlet var continueButton: UIButton!
    @IBAction func continueButtonTapped(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(identifier: viewcontrollers.LoginVC.rawValue) as! LoginVC
        self.navigationController?.pushViewController(storyboard, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
