//
//  WriteViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/20.
//

import UIKit

class WriteViewController: UIViewController {

    @IBOutlet var backBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true)
        print("뒤로가기 버튼")
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
