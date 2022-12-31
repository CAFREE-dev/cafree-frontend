//
//  HomeTabViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/04.
//

import UIKit

class HomeTabViewController: UIViewController {

    @IBOutlet var homeSegCon: UISegmentedControl!
    
    @IBOutlet weak var popCafeView: UIView!
    @IBOutlet weak var nearCafeView: UIView!
    @IBOutlet weak var conseptCafeView: UIView!
    @IBOutlet weak var newCafeView: UIView!
    
    @IBOutlet var navigationSearchBtn: UIBarButtonItem!
    
    @IBOutlet var navigationWriteBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        removeBackgroundAndDivider()
        setSegCon()
    }
    
    // 세그먼트컨트롤 뷰 커스텀
    // 회색 배경과 divider를 지우는 코드 추가
    private func removeBackgroundAndDivider() {
        let image = UIImage()
        homeSegCon.setBackgroundImage(image, for: .normal, barMetrics: .default)
        homeSegCon.setBackgroundImage(image, for: .selected, barMetrics: .default)
        homeSegCon.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
        
        homeSegCon.setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }
    
    // 선택시 글 색 바꾸기
    private func setSegCon() {
        // 선택시 글 색 바꾸기
        homeSegCon.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
            homeSegCon.setTitleTextAttributes(
              [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 13, weight: .semibold)
              ],
              for: .selected
            )
            homeSegCon.selectedSegmentIndex = 0
        
        homeSegCon.layer.cornerRadius = 0
        
        lazy var underlineView: UIView = {
            let width = homeSegCon.bounds.size.width / CGFloat(homeSegCon.numberOfSegments)
            let height = 2.0
            let xPosition = CGFloat(homeSegCon.selectedSegmentIndex * Int(width))
            let yPosition = homeSegCon.bounds.size.height - 1.0
            let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            let view = UIView(frame: frame)
            view.backgroundColor = UIColor.green
            homeSegCon.addSubview(view)
            return view
        }()
        
        
        let underlineFinalXPosition = (homeSegCon.bounds.width / CGFloat(homeSegCon.numberOfSegments)) * CGFloat(homeSegCon.selectedSegmentIndex)
            UIView.animate(
              withDuration: 0.1,
              animations: {
                  underlineView.frame.origin.x = underlineFinalXPosition
              }
        )
        
    }
    
    // 검색 버튼 클릭시
    @IBAction func searchBtnClicked(_ sender: Any) {
        // 뷰 전환
        guard let searchView = self.storyboard?.instantiateViewController(identifier: "SearchViewController") else {return}
        self.present(searchView, animated: true)
    }
    
    @IBAction func writeBtnClicked(_ sender: Any) {
        guard let writeView = self.storyboard?.instantiateViewController(identifier: "WriteViewController") else {return}
        self.present(writeView, animated: true)
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            popCafeView.alpha = 1
            nearCafeView.alpha = 0
            conseptCafeView.alpha = 0
            newCafeView.alpha = 0
        }else if sender.selectedSegmentIndex == 1 {
            popCafeView.alpha = 0
            nearCafeView.alpha = 1
            conseptCafeView.alpha = 0
            newCafeView.alpha = 0
        }else if sender.selectedSegmentIndex == 2 {
            popCafeView.alpha = 0
            nearCafeView.alpha = 0
            conseptCafeView.alpha = 1
            newCafeView.alpha = 0
        }else {
            popCafeView.alpha = 0
            nearCafeView.alpha = 0
            conseptCafeView.alpha = 0
            newCafeView.alpha = 1
        }
    }
    
}

