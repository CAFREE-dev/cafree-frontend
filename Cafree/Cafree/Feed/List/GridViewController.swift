// 피드 - 그리드 화면
import UIKit

//private let reuseIdentifier = "Cell"

class GridViewController: UIViewController {

    @IBOutlet weak var gridViewController: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gridViewController.delegate = self
        gridViewController.dataSource = self
        
        gridViewController.reloadData()
    }
}


extension GridViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width / 3.5
        let height: CGFloat = collectionView.frame.width / 3.5

        return CGSize(width: width, height: height)
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .purple
            return cell
    }


}



