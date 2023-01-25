//
//  WriteViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/20.
//

import UIKit
import BSImagePicker
import Photos
import Alamofire

class WriteViewController: UIViewController, UITextViewDelegate{
    
    
    @IBOutlet var registerCafeBtn: UIButton!
    
    @IBOutlet var reviewTextView: UITextView!
    @IBOutlet var backBtn: UIBarButtonItem!
    
    @IBOutlet var photoSelectBtn: UIButton!
    @IBOutlet var photoCollectionView: UICollectionView!
    var selectedAssets : [PHAsset] = []
    var selectImages : [UIImage] = []
    //let imagePicker = ImagePickerController()
    
    @IBOutlet var starSlider: UISlider!
    @IBOutlet var starLabel: UILabel!
    
    
    var starImageViews = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPhotoBtn()
        
        placeholderSetting()
        // Do any additional setup after loading the view.
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.reloadData()
        registerCell()
    
    }
    private func initPhotoBtn(){
        photoSelectBtn.layer.borderWidth = 0.8
        photoSelectBtn.layer.borderColor = UIColor.lightGray.cgColor
        photoSelectBtn.layer.cornerRadius = 8
        
        photoSelectBtn.setTitle(String(self.selectImages.count)+"/4", for: .normal)
        
    }
    
    @IBAction func photoBtnClicked(_ sender: UIButton) {
        selectedAssets.removeAll()
        selectImages.removeAll()
        
        let imagePicker = ImagePickerController()
        imagePicker.settings.selection.max = 4
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
        
        self.presentImagePicker(imagePicker, select: { (asset) in
            // User selected an asset. Do something with it. Perhaps begin processing/upload?
        }, deselect: { (asset) in
            // User deselected an asset. Cancel whatever you did when asset was selected.
        }, cancel: { (assets) in
            // User canceled selection.
        }, finish: { (assets) in
            
            for i in 0..<assets.count {
                self.selectedAssets.append(assets[i])
            }
            self.convertAssetToImages()
            self.photoCollectionView.reloadData()
            
        })
        
        
    }
    //PH이미지 UIImage로 바꾸기
    func convertAssetToImages() {
            
        if selectedAssets.count != 0 {
                
            for i in 0..<selectedAssets.count {
                    
                let imageManager = PHImageManager.default()
                let option = PHImageRequestOptions()
                option.isSynchronous = true
                var thumbnail = UIImage()
                    
                imageManager.requestImage(for: selectedAssets[i],
                                              targetSize: CGSize(width: 200, height: 200),
                                              contentMode: .aspectFit,
                                              options: option) { (result, info) in
                        thumbnail = result!
                }
                    
                let data = thumbnail.jpegData(compressionQuality: 0.7)
                let newImage = UIImage(data: data!)
                    
                self.selectImages.append(newImage! as UIImage)
                
                self.photoSelectBtn.setTitle(String(self.selectImages.count)+"/4", for: .normal)
            }
        }
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "SelectedImageCollectionViewCell", bundle: nil)
        photoCollectionView.register(nib, forCellWithReuseIdentifier: "photoCell")
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
    
    
    @IBAction func registerBtnClicked(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterCafeViewController") as? RegisterCafeViewController else {return}
        print("카페등록 페이지 이동")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func postTest() {
        let url = "https://ptsv2.com/t/im8p3-1592789118/post"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        //POST 로 보낼 정보
        let params = ["id":"아이디", "pw":"패스워드"] as Dictionary
        
        //httpBody 에 parameters 추가
        do{
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString {(response) in
            switch response.result {
            case .success:
                print("POST 성공")
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
        
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
        return selectImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? SelectedImageCollectionViewCell else {
            print("cell 문제")
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.indexPathRow = indexPath.row
        cell.photoView.image = selectImages[indexPath.row]
        
        return cell
    }
    
}

extension WriteViewController: SelectedImageCollectionViewCellDelegate{
    func didDeselectButtonClicked(at index: Int) {
        selectImages.remove(at: index)
        photoCollectionView.reloadData()
        self.photoSelectBtn.setTitle(String(self.selectImages.count)+"/4", for: .normal)
    }
    
}
