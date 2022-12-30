//
//  RegisterCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/30.
//

import UIKit

class RegisterCafeViewController: UIViewController {

    @IBOutlet var searchCafeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchCafeTextField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: searchCafeTextField.frame.size.height-1, width: searchCafeTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.black.cgColor
        searchCafeTextField.layer.addSublayer((border))
        searchCafeTextField.textColor = UIColor.black
        
        searchCafeTextField.addLeftPadding()
        searchCafeTextField.addleftimage(image: UIImage(named: "searchIconGray")!)
        
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


