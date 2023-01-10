//
//  WishTabViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2022/12/25.
//

import UIKit

class WishTabViewController: UIViewController  {

    @IBOutlet var wishTabView: UICollectionView!
    @IBOutlet var sortBtn: UIButton!
    
    
    let cellSpacingHeight: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wishTabView.delegate = self
        wishTabView.dataSource = self
        
        

        initNib()
        initSortBtn()
        initNavigationBarColor()
    }
    
    func initNib() {
        let cellNib = UINib(nibName: "WishCollectionViewCell", bundle: nil)
        wishTabView.register(cellNib, forCellWithReuseIdentifier: "WishCollectionViewCell")
    }
    
    func initSortBtn() {
        sortBtn.setTitle("최신순", for: .normal)
        sortBtn.titleLabel?.font = UIFont(name: "SUITVariable-Regular", size: 12)
        
        sortBtn.layer.cornerRadius = 16
         sortBtn.layer.borderColor = UIColor.lightGray.cgColor
        sortBtn.layer.borderWidth = 0.6
       
        
        sortBtn.setTitleColor(.black, for: .normal)
        
    }
    
    func initNavigationBarColor() {
        // 네비게이션 바 색상 변경
        let navigationBarAppearance = UINavigationBarAppearance() // navigationBar 를 설정해줘야 스크롤 했을 때 색상이 안 보임.
        navigationBarAppearance.backgroundColor = .primary
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
}


extension WishTabViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width - 32, height: self.view.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = wishTabView.dequeueReusableCell(withReuseIdentifier: "WishCollectionViewCell", for: indexPath) as! WishCollectionViewCell
        
        cell.wishCellDelegate = self
              //  cell.cafeImg.sizeToFit()
        cell.cafeName.text = "스타벅스 안양운동장사거리DT점"
        cell.cafeLocal.text = "경기 안양시 동안구 관악대로 234"
        
        cell.cafeName.textColor = .secondary
        cell.cafeLocal.textColor = .gray
        
        cell.cafeName.font = UIFont(name: "SUITVariable-Bold", size: 12)
        cell.cafeLocal.font = UIFont(name: "SUITVariable-Medium", size: 10)
        
        
        cell.wishBtn.setImage(UIImage(named: "nice1"), for: .normal)
        cell.wishBtn.setImage(UIImage(named: "nice2"), for: .selected)
        cell.wishBtn.isSelected = true
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 4
                
        
        
        return cell
        
    }
    
    // CollectionView Cell의 위아래 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 8.0
//    }

     //CollectionView Cell의 옆 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 16.0
//    }
    
}

extension WishTabViewController : WishCollectionViewCellDelegate {
    func wishBtnClicked(_ sender: UIButton) {
        print("wishBtnClicked")
        if sender.isSelected {
            sender.isSelected = false
        }else {
            sender.isSelected = true
        }
    }
}

