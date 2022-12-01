// 피드 - 리스트 화면
import UIKit

//private let reuseIdentifier = "Cell"

class ListViewController: UIViewController {
    
    @IBOutlet weak var listViewController: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listViewController.delegate = self
        listViewController.dataSource = self
        
        listViewController.reloadData()
    }   
}

extension ListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width - 20
        let height: CGFloat = collectionView.frame.height - 30

        return CGSize(width: width, height: height)
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .red
            return cell
    }


}



