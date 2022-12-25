//
//  WishTabViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2022/12/25.
//

import UIKit

class WishTabViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var sortBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // 테이블뷰 라인 없애기
        tableView.separatorStyle = .none

        initNib()
        initSortBtn()
    }
    
    func initNib() {
        let cellNib = UINib(nibName: "WishTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "wishTableCell")
    }
    
    func initSortBtn() {
        sortBtn.setTitle("최신순", for: .normal)
        sortBtn.layer.cornerRadius = 15
        sortBtn.layer.borderColor = UIColor.lightGray.cgColor
        sortBtn.layer.borderWidth = 1
       
        
        sortBtn.setTitleColor(.black, for: .normal)
        
    }
    

}

extension WishTabViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishTableCell", for: indexPath) as! WishTableViewCell
        
        cell.cafeImg.sizeToFit()
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        
       
        return cell
    }
    
    // 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let height: CGFloat = tableView.frame.height / 10
        let width : CGFloat = tableView.frame.width - 10
            
            return CGSize(width: width, height: height)
        }

    
    
     //Section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    // 각 Section 사이의 간격 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    // Section의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 10
    }

}

