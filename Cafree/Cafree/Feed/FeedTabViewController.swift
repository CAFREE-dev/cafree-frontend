import UIKit

class FeedTabViewController: UIViewController {
    
    @IBOutlet weak var sortBtn: UIButton!
    var isClicked = false
    
    @IBOutlet var listView: UIView!
    @IBOutlet var gridView: UIView!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
