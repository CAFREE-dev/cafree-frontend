import UIKit

class FeedTabViewController: UIViewController {
    
    @IBOutlet weak var sortBtn: UIButton!
    var isClicked = false
    
    @IBOutlet var listView: UIView!
    @IBOutlet var gridView: UIView!
    
    
    @IBOutlet var tagBtn : [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTagBtn()
        initNavigationBarColor()
    }
    
    func initTagBtn(){
        let tagBtnTitleText = ["카페이름", "위치", "분위기", "좋아요", "평가"]
        var tagBtnIndex = 0
        for i in tagBtn {
            i.setTitle(tagBtnTitleText[tagBtnIndex], for: .normal)
            i.setTitleColor(.black, for: .normal)
            i.tintColor = UIColor.clear
            i.layer.cornerRadius = 15
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.lightGray.cgColor

            tagBtnIndex += 1
        }
    }
    
    func initNavigationBarColor() {
        // 네비게이션 바 색상 변경
        let navigationBarAppearance = UINavigationBarAppearance() // navigationBar 를 설정해줘야 스크롤 했을 때 색상이 안 보임.
        navigationBarAppearance.backgroundColor = .primary
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    
    // false :
    @IBAction func sortBtnClicked(_ sender: UIButton) {
        isClicked = !isClicked
        
        if !isClicked {
            //sender.setImage(UImage(named:"square.grid.2x2.fill"), for: .normal)
            showGridView()
        }else if isClicked {
            showListView()
        }
    }
    
    func showListView() {
        listView.alpha = 1.0
        gridView.alpha = 0.0
    }
    
    func showGridView() {
        listView.alpha = 0.0
        gridView.alpha = 1.0
    }
}
