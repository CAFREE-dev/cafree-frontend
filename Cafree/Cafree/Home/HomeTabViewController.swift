//
//  HomeTabViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/04.
//

import UIKit

class HomeTabViewController: UIViewController {

    //@IBOutlet var btn : UIButton!
    
    @IBOutlet weak var popCafeView: UIView!
    @IBOutlet weak var nearCafeView: UIView!
    @IBOutlet weak var conseptCafeView: UIView!
    @IBOutlet weak var newCafeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //버튼 클릭시
    //@IBAction func touchBtn(_ sender: UIButton){
    //    // 뷰 전환
//
    //
    //    guard let myLocaionView = self.storyboard?.instantiateViewController(identifier: "MyLocationViewController") else //{return}
    //      self.present(myLocaionView, animated: true)
    //}
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            popCafeView.alpha = 1
            nearCafeView.alpha = 0
            conseptCafeView.alpha = 0
            newCafeView.alpha = 0
        }else if sender.selectedSegmentIndex == 1 {
            popCafeView.alpha = 0
            nearCafeView.alpha = 1
            conseptCafeView.alpha = 0
            newCafeView.alpha = 0
        }else if sender.selectedSegmentIndex == 2 {
            popCafeView.alpha = 0
            nearCafeView.alpha = 0
            conseptCafeView.alpha = 1
            newCafeView.alpha = 0
        }else {
            popCafeView.alpha = 0
            nearCafeView.alpha = 0
            conseptCafeView.alpha = 0
            newCafeView.alpha = 1
        }
    }
    
}

