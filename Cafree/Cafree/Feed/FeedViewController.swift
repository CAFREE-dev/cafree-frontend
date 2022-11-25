//
//  FeedViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2022/11/24.
//

import UIKit

class FeedViewController: ViewController {
    
    fileprivate let tableCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableCollectionView)
        tableCollectionView.backgroundColor = .white
        tableCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
        tableCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        tableCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        tableCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -40).isActive = true
        
        tableCollectionView.delegate = self
        tableCollectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 50, height: collectionView.frame.width - 30)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
    
    
}
