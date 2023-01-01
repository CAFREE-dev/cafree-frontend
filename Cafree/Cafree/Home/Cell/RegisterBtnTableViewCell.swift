//
//  RegisterBtnTableViewCell.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/30.
//

import UIKit

class RegisterBtnTableViewCell: UITableViewCell {

    @IBOutlet var registerBtn: UIButton!
    
    var delegate: RegisterBtnClickedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func registerBtnClicked(_ sender: Any) {
        self.delegate?.registerBtnClicked()
    }
    
}
protocol RegisterBtnClickedDelegate {
    func registerBtnClicked ()
}
