//
//  ConseptTableViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/29.
//

import UIKit

class ConseptTableViewCell: UITableViewCell {

    @IBOutlet var conseptBtn: UIButton!
    @IBOutlet var conseptLabel: UILabel!
    
    var delegate : ConseptChangeDelegate?
    var consept = "모던한"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func conseptBtnClicked(_ sender: Any) {
        self.delegate?.conseptChange()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
protocol ConseptChangeDelegate {
    func conseptChange()
}
