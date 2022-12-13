//
//  DetailCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/13.
//

import UIKit

class DetailCafeViewController: UIViewController {
    
    @IBOutlet var sampleLabel: UILabel!
    var receiveItem = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        sampleLabel.text = receiveItem
        // Do any additional setup after loading the view.
    }
    func receiveItem(_ item: String){
            receiveItem = item
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
