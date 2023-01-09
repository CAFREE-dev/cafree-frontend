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
        let width: CGFloat = collectionView.frame.width - 32
        let height: CGFloat = collectionView.frame.height - 100

        return CGSize(width: width, height: height)
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    // cell id : listCollectioncell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        cell.cellDelegate = self
        
              //  cell.cafeImg.sizeToFit()
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 4
                
                
        cell.moreBtn.setImage(UIImage(named: "more"), for: .normal)
        cell.moreBtn.setTitle("", for: .normal)
        
        
        cell.likeBtn.setImage(UIImage(named: "good1"), for: .normal)
        cell.likeBtn.setTitle("", for: .normal)
        
        
        cell.nameLabel.text = "닉네임"
        cell.dateLabel.text = "2022.11.30."
        
        cell.tag1Label.text = "#감각적인"
        cell.tag2Label.text = "#커피가 맛있는"
        cell.tag1Label.textColor = .white
        cell.tag2Label.textColor = .white
        
        cell.likeCount.text = "1.6k"
        cell.likeCount.textColor = .white
        
        cell.cafeName.text = "어퍼스트로피"
        cell.cafeInfo.text = "브런치가 맛있는 누하동 어퍼스트로피"
        
        
        return cell
       
    }
}

extension ListViewController : ListCollectionViewCellDelegate {

    
    func moreBtnClicked() {
        print("moreBtnClicked!")
        
//        let moreViewController = MoreViewController()
//        self.present(moreViewController, animated: true)
        
        // 일단 더보기 버튼에 신고하기 페이지 바로 연결 
        //Storyboard ID에 이름 설정 후("ReportViewController")
        let storyboard = UIStoryboard(name: "ReportViewController", bundle: nil)
        let reportVC: ReportViewController = storyboard.instantiateViewController(withIdentifier: "reportViewController") as! ReportViewController
        reportVC.modalPresentationStyle = .fullScreen//전체화면(기본은 팝업형태)
        self.navigationController?.pushViewController(reportVC, animated: true)
    }
    
    func likeBtnClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(named: "nice2"), for: .selected)
        } else if !sender.isSelected {
            sender.setImage(UIImage(named: "nice1"), for: .normal)
        }
    }
}
