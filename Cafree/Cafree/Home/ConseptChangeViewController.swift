//
//  ConseptChangeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2023/01/02.
//

import UIKit

class ConseptChangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 프레젠테이션 설정
        if #available(iOS 16.0, *) {
            if let sheetPresentationController = sheetPresentationController {
                sheetPresentationController.detents = [
                    .custom{ _ in
                        return 200
                    }
                ]
                sheetPresentationController.prefersGrabberVisible = true
                sheetPresentationController.preferredCornerRadius = 20
            }
        } else {
            // Fallback on earlier versions
        }
        // Do any additional setup after loading the view.
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
