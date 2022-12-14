//
//  PhotoBtnCollectionViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/23.
//
import Foundation
import UIKit
import BSImagePicker
import Photos

class PhotoBtnCollectionViewCell: UICollectionViewCell {

    @IBOutlet var photoBtn: UIButton!
    var selectedAssets : [PHAsset] = []
    var userSelectedImages : [UIImage] = []
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photoBtn.layer.borderWidth = 0.8
        photoBtn.layer.borderColor = UIColor.lightGray.cgColor
        photoBtn.layer.cornerRadius = 8
    }

    
    
    @IBAction func photoBtnClicked(_ sender: UIButton) {
        
    }
    
    
}
