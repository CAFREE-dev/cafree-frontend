//
//  MoreViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2023/01/08.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 15.0, *) {
            if let sheetPresentationController = sheetPresentationController {
                sheetPresentationController.detents = [.medium(), .large()]
            }
        } else {
            // Fallback on earlier versions
        }
    }
    

    

}
