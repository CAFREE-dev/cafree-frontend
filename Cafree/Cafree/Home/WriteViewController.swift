//
//  WriteViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/20.
//

import UIKit
import BSImagePicker

class WriteViewController: UIViewController, UITextViewDelegate{
    
    

    @IBOutlet var reviewTextView: UITextView!
    @IBOutlet var backBtn: UIBarButtonItem!
    
    @IBOutlet var photoCollectionView: UICollectionView!
    var selectImages : [Any] = []
    //let imagePicker = ImagePickerController()
    
    @IBOutlet var starSlider: UISlider!
    @IBOutlet var starLabel: UILabel!
    
    
    var starImageViews = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholderSetting()
        // Do any additional setup after loading the view.
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        registerCell()
    
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "PhotoBtnCollectionViewCell", bundle: nil)
        photoCollectionView.register(nib, forCellWithReuseIdentifier: "photoBtnCell")
    }
    
    // TextView placeholder 세팅
    func placeholderSetting() {
        reviewTextView.delegate = self // reviewTextView가 유저가 선언한 outlet
        reviewTextView.text = "글 작성하기"
        reviewTextView.textColor = UIColor.lightGray
        reviewTextView.layer.borderColor = UIColor.lightGray.cgColor
        reviewTextView.layer.borderWidth = 0.8
        reviewTextView.layer.cornerRadius = 8
        
            
    }
    // TextView Place Holder
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
            
    }
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "글 작성하기"
            textView.textColor = UIColor.lightGray
        }
    }
    //텍스트 뷰 작성 중 다른 곳 터치 했을 때 텍스트 뷰 작성 끝내기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.reviewTextView.resignFirstResponder()
    }
    
    
    @IBAction func starSliderSlided(_ sender: UISlider) {
        let floatValue = floor(sender.value * 10) / 10 + 0.5
                
        for index in 1...5 {
            if let starImage = view.viewWithTag(index) as? UIImageView {
                if Float(index) <= floatValue {
                    starImage.image = UIImage(named: "fullStar")
                } else {
                    starImage.image = UIImage(named: "emptyStar")
                }
            }
        }
        
        let intValue = Int(floatValue)
        var strScore = "()"
        switch intValue{
        case 0...1 :
            strScore = "(나빠요)"
        case 2 :
            strScore = "(별로예요)"
        case 3 :
            strScore = "(그냥 그래요)"
        case 4 :
            strScore = "(좋아요)"
        case 5 :
            strScore = "(최고예요)"
        default :
            strScore = "()"
        }
        starLabel.text = String(intValue) + "점 " + strScore
                
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
extension WriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 90, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoBtnCell", for: indexPath) as? PhotoBtnCollectionViewCell else {
            print("cell 문제")
            return UICollectionViewCell()
        }
        
        return cell
        
    }
    
    
}
