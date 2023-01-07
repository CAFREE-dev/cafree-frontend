//
//  ReportViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2023/01/04.
//

import UIKit

class ReportViewController: UIViewController {

    @IBOutlet var radioBtnArray: [UIButton]!
    
    @IBOutlet var radioLabelArray: [UILabel]!
    
    var indexOfOneAndOnly: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        initRadioBtn()
        initRadioLabel()
    }
    
    func initRadioBtn() {
        for btn in radioBtnArray {
            btn.setImage(UIImage(named: "checkbox-default"), for: .normal)
        }
    }
    
    func initRadioLabel() {
        let radioLabelTitle = ["신뢰하기 어려운 게시물", "부적절한 내용", "명예훼손 및 저작권 침해"]
        var labelIndex = 0
        for label in radioLabelArray {
            label.text = radioLabelTitle[labelIndex]
            labelIndex += 1
        }
    }

    
    @IBAction func touchRadioBtn(_ sender: UIButton) {
        if indexOfOneAndOnly != nil {
            if !sender.isSelected {
                for index in radioBtnArray.indices {
                    radioBtnArray[index].isSelected = false
                    radioBtnArray[index].setImage(UIImage(named: "checkbox-default"), for: .normal)
                }
                sender.isSelected = true
                sender.setImage(UIImage(named:"checkbox-enable"), for: .normal)
                indexOfOneAndOnly = radioBtnArray.firstIndex(of: sender)
            } else {
                sender.isSelected = false
                sender.setImage(UIImage(named: "checkbox-default"), for: .normal)
                indexOfOneAndOnly = nil
            }
            
        } else {
            sender.isSelected = true
            sender.setImage(UIImage(named:"checkbox-enable"), for: .normal)
            indexOfOneAndOnly = radioBtnArray.firstIndex(of: sender)
        }
    }
    deinit {
        radioLabelArray = nil;
    }
}
