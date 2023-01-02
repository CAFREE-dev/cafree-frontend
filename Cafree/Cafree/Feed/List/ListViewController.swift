//
//  ListViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2022/12/23.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet var listView: UICollectionView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listView.delegate = self
        listView.dataSource = self
        
        listView.reloadData()
        
        initNib()
    }
    
    func initNib() {
        let cellNib = UINib(nibName: "ListCollectionViewCell", bundle: nil)
        listView.register(cellNib, forCellWithReuseIdentifier: "ListCollectionViewCell")
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width - 20
        let height: CGFloat = collectionView.frame.height - 100

        return CGSize(width: width, height: height)
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    // cell id : listCollectioncell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        
              //  cell.cafeImg.sizeToFit()
        
                cell.layer.borderColor = UIColor.lightGray.cgColor
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius = 4
      

        
                return cell
        
        
        
        
    }


}
