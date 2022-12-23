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
           
            tagBtnIndex += 1
        }
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
