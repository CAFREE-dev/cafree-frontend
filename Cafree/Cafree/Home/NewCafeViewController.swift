//
//  NewCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/05.
//

import UIKit

class NewCafeViewController: UIViewController {

    @IBOutlet var btnLocation : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
    //버튼 클릭시
    @IBAction func touchBtnLocation(_ sender: UIButton){
        // 뷰 전환
        guard let myLocaionView = self.storyboard?.instantiateViewController(identifier: "MyLocationViewController") else {return}
        self.present(myLocaionView, animated: true)
    }
}
