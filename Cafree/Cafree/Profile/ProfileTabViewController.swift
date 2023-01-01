//
//  ProfileTabViewController.swift
//  Cafree
//
//  Created by 한수빈 on 2022/12/26.
//

import UIKit

class ProfileTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initNavigationBarColor()
    }
    

    func initNavigationBarColor() {
        // 네비게이션 바 색상 변경
        let navigationBarAppearance = UINavigationBarAppearance() // navigationBar 를 설정해줘야 스크롤 했을 때 색상이 안 보임.
        navigationBarAppearance.backgroundColor = .primary
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }

}
