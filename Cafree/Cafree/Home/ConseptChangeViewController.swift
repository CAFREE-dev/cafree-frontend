//
//  ConseptChangeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2023/01/02.
//

import UIKit

class ConseptChangeViewController: UIViewController {

    
    @IBOutlet var btnMo: UIButton!
    @IBOutlet var btnNature: UIButton!
    @IBOutlet var btnNation: UIButton!
    @IBOutlet var btnRetro: UIButton!
    @IBOutlet var btnDiff: UIButton!
    
    var delegate : ConseptChoseDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 프레젠테이션 설정
        if #available(iOS 16.0, *) {
            if let sheetPresentationController = sheetPresentationController {
                sheetPresentationController.detents = [
                    .custom{ _ in
                        return 210
                    }
                ]
                sheetPresentationController.prefersGrabberVisible = true
                sheetPresentationController.preferredCornerRadius = 20
            }
        } else {
            // Fallback on earlier versions
        }
        // Do any additional setup after loading the view.
        
        btnInit()
    }
    
    //밑줄 추가
    private func btnInit(){
        let border1 = CALayer()
        let border2 = CALayer()
        let border3 = CALayer()
        let border4 = CALayer()
        let border5 = CALayer()
        let borders = [border1,border2,border3,border4,border5]
        for border in borders{
            border.frame = CGRect(x: 0, y: btnMo.frame.size.height-1, width: btnMo.frame.width, height: 1)
            border.backgroundColor = UIColor.gray.cgColor
        }
        btnMo.layer.addSublayer((border1))
        btnNature.layer.addSublayer((border2))
        btnNation.layer.addSublayer((border3))
        btnRetro.layer.addSublayer((border4))
        btnDiff.layer.addSublayer((border5))
    }
    @IBAction func clickedMo(_ sender: Any) {
        self.delegate?.conseptChosedMo()
        self.dismiss(animated: true)
    }
    @IBAction func clickedNature(_ sender: Any) {
        self.delegate?.conseptChosedNature()
        self.dismiss(animated: true)
    }
    @IBAction func clickedNation(_ sender: Any) {
        self.delegate?.conseptChosedNation()
        self.dismiss(animated: true)
    }
    
    @IBAction func clickedRetro(_ sender: Any) {
        self.delegate?.conseptChosedRetro()
        self.dismiss(animated: true)
    }
    @IBAction func clickedDiff(_ sender: Any) {
        self.delegate?.conseptChosedDiff()
        self.dismiss(animated: true)
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
protocol ConseptChoseDelegate{
    func conseptChosedMo()
    func conseptChosedNature()
    func conseptChosedNation()
    func conseptChosedRetro()
    func conseptChosedDiff()
}
