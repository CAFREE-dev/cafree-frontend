//
//  ReportViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2023/01/04.
//

import UIKit

class ReportViewController: UIViewController {
    
    let textViewPlaceHolder = "타당한 사유가 없는 허위 신고 시 이용에 제한이 가해질 수 있으므로, 신중하게 제보해주세요. \n신고된 내용은 7일 이내의 처리됩니다."

    // 신고사유 라디오 버튼
    @IBOutlet var radioBtnArray: [UIButton]!
    
    // 신고사유 라벨
    @IBOutlet var radioLabelArray: [UILabel]!
    
    // 라디오 버튼 체크용 인덱스
    var indexOfOneAndOnly: Int?
    
    // 신고내용 작성 텍스트 뷰
    @IBOutlet var reportTextView: UITextView!
    
    // 타이틀 : 신고 사유, 상세 내용
    @IBOutlet var titleArray: [UILabel]!
    
    // 신고하기 버튼
    @IBOutlet var reportBtn: UIButton!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        initRadioBtn()
        initRadioLabel()
        initTitle()
        initReportTextView()
    }
    
    func initRadioBtn() {
        for btn in radioBtnArray {
            btn.setImage(UIImage(named: "checkbox-default"), for: .normal)
            btn.setImage(UIImage(named: "checkbox-enable"), for: .selected)
            btn.setTitle("", for: .normal)
        }
        
    }
    
    func initRadioLabel() {
        let radioLabelTitle = ["신뢰하기 어려운 게시물", "부적절한 내용", "명예훼손 및 저작권 침해"]
        var labelIndex = 0
        for label in radioLabelArray {
            label.text = radioLabelTitle[labelIndex]
            label.font = UIFont(name: "SUITVariable-Regular", size: 12)
            label.textColor = .gray
            labelIndex += 1
        }
    }
    
    func initTitle() {
        let title = ["신고 사유", "상세 내용"]
        var labelIndex = 0
        for label in titleArray {
            label.text = title[labelIndex]
            label.font = UIFont(name: "SUITVariable-Bold", size: 14)
            label.textColor = .primary
            labelIndex += 1
        }
    }
    
    func initReportTextView(){
        reportTextView.delegate = self
        reportTextView.text = textViewPlaceHolder
        reportTextView.textColor = .lightGray
        reportTextView.layer.cornerRadius = 4
        reportTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        reportBtn.setTitle("신고하기", for: [.normal, .disabled])
        reportBtn.titleLabel?.font = UIFont(name: "SUITVariable-Regular", size: 16)
        
        reportBtn.isEnabled = false
        reportBtn.backgroundColor = .lightGray
        reportBtn.titleLabel?.textColor = .gray
        reportBtn.layer.cornerRadius = 4
        
    }
    
    @IBAction func touchRadioBtn(_ sender: UIButton) {
        if indexOfOneAndOnly != nil {
            if !sender.isSelected {
                for index in radioBtnArray.indices {
                    radioBtnArray[index].isSelected = false
                    //radioBtnArray[index].setImage(UIImage(named: "checkbox-default"), for: .normal)
                }
                sender.isSelected = true
                //sender.setImage(UIImage(named:"checkbox-enable"), for: .normal)
                indexOfOneAndOnly = radioBtnArray.firstIndex(of: sender)
            } else {
                sender.isSelected = false
                //sender.setImage(UIImage(named: "checkbox-default"), for: .normal)
                indexOfOneAndOnly = nil
            }
            
        } else {
            sender.isSelected = true
            //sender.setImage(UIImage(named:"checkbox-enable"), for: .normal)
            indexOfOneAndOnly = radioBtnArray.firstIndex(of: sender)
        }
    }
    deinit {
        radioLabelArray = nil;
    }
    
    
    @IBAction func reportBtnClicked(_ sender: UIButton) {
        print("reportBtnClicked!")
        if reportBtn.isEnabled {
            
        }
        
        
    }
    
    
    
    
}

// textView Place Holder
extension ReportViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = UIColor.lightGray
            
            reportBtn.isEnabled = false
            reportBtn.backgroundColor = .lightGray
            reportBtn.titleLabel?.textColor = .gray
        } else {
            reportBtn.isEnabled = true
            reportBtn.backgroundColor = .secondary
            reportBtn.titleLabel?.textColor = .white
        }
    }
}
