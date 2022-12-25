//
//  SelectedImageCollectionViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/23.
//

import UIKit

class SelectedImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet var photoView: UIImageView!
    @IBOutlet var btnExit: UIButton!
    
    var indexPathRow: Int?
    weak var delegate: SelectedImageCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnExitClicked(_ sender: UIButton) {
        if let index = indexPathRow {
            delegate?.didDeselectButtonClicked(at: index)
        }
    }
}
protocol SelectedImageCollectionViewCellDelegate: AnyObject {
    func didDeselectButtonClicked(at index: Int)
}
