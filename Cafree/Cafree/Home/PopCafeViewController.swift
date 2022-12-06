//
//  popCafeViewController.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/05.
//

import UIKit

class PopCafeViewController: UIViewController{

    
    @IBOutlet var btnLocation : UIButton!
    
    @IBOutlet weak var cafeTableView: UITableView!
    
    var cafes = ["sample1","sample2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cafeTableView.dataSource = self
        
    }
 
    //버튼 클릭시
    @IBAction func touchBtnLocation(_ sender: UIButton){
        // 뷰 전환
        guard let myLocaionView = self.storyboard?.instantiateViewController(identifier: "MyLocationViewController") else {return}
        self.present(myLocaionView, animated: true)
        
    }
    
}

extension PopCafeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cafeTableView.dequeueReusableCell(withIdentifier: "cafeCell") as! CafeTableViewCell
        let cafe = cafes[indexPath.row]
        
        cell.cafeName.text = cafe
        cell.cafeImgView.image = UIImage(named: "sampleCafeImg"+String(indexPath.row+1))
        
        return cell
    }
}
