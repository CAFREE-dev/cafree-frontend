import UIKit
class FeedViewController : UIViewController {
    
    @IBOutlet weak var sortBtn: UIButton!
    var isClicked = false
    
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var gridView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func sortBtnClicked(_ sender: UIButton) { // true : list, false : grid
        if !isClicked {
            sender.setImage(UIImage(named: "square.grid.2x2.fill"), for:.normal)
            isClicked = true
            showGridView()
        } else if isClicked {
            sender.setImage(UIImage(named: "pencil.circle.fill"), for: .normal)
            isClicked = false
            showListView()
        }
    }
    
    func showListView(){
        listView.alpha = 1.0
        gridView.alpha = 0.0
    }
    
    func showGridView(){
        listView.alpha = 0.0
        gridView.alpha = 1.0
    }
    
    
}

















//import UIKit
//
//class FeedViewController: ViewController {
    
//    lazy var horizontalScrollView: HorizontalScrollView = {
//        let view = HorizontalScrollView()
//        return view
//    }()
//
//    fileprivate let tableCollectionView:UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//
//        return cv
//    }()

//    override func viewDidLoad() {
//        super.viewDidLoad()
        
//        configure()
//
//        view.addSubview(tableCollectionView)
//        tableCollectionView.backgroundColor = .white
//        tableCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
//        tableCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        tableCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//        tableCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -40).isActive = true
//
//        tableCollectionView.delegate = self
//        tableCollectionView.dataSource = self
        

//    }
    
//    private func configure(){
//        view.addSubview(horizontalScrollView)
//        horizontalScrollView.snp.makeConstraints{ make in
//            make.center.width.equalToSuperview()
//            make.height.equalTo(56)
//        }
//    }
    
    
//}

//extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width - 50, height: collectionView.frame.width - 30)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .red
//        return cell
//    }
//}
