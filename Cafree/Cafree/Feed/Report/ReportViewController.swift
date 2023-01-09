//
//  ReportViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2023/01/04.
//

import UIKit

class ReportViewController: UIViewController {

    // 신고사유 라디오 버튼
    @IBOutlet var radioBtnArray: [UIButton]!
    
    // 신고사유 라벨
    @IBOutlet var radioLabelArray: [UILabel]!
    
    // 라디오 버튼 체크용 인덱스
    var indexOfOneAndOnly: Int?
    
    // 신고내용 작성 텍스트 뷰
    @IBOutlet var reportTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initRadioBtn()
        initRadioLabel()
        
    }
    
    func initRadioBtn() {
        for btn in radioBtnArray {
            btn.setImage(UIImage(systemName: "checkbox-default"), for: .normal)
            btn.setImage(UIImage(systemName: "checkbox-enable"), for: .selected)
            btn.setTitle("", for: .normal)
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
    
    
    func initReportTextView(){
        reportTextView.text = "타당한 사유가 없는 허위 신고 시 이용에 제한이 가해질 수 있으므로,신중하게 제보해주세요.신고된 내용은 7일 이내의 처리됩니다."
        reportTextView.textColor = .lightGray
    }
}
