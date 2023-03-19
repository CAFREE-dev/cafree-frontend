//
//  SignUpViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2023/01/10.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginK(_ sender: UIButton) {
        
        let mainNC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarViewController")
            mainNC.modalPresentationStyle = .fullScreen
            mainNC.modalTransitionStyle = .crossDissolve
            present(mainNC, animated: true)
        
    }
    
   
}


//func showMainViewController() {
//    let mainNC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTapBarController")
//    mainNC.modalPresentationStyle = .fullScreen
//    mainNC.modalTransitionStyle = .crossDissolve
//    present(mainNC, animated: true)
//}
