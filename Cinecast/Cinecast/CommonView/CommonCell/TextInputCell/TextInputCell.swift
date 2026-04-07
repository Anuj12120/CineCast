//
//  TextInputCell.swift
//  Cinecast
//
//  Created by Anand Mahajan on 07/04/26.
//

import UIKit

class TextInputCell: UITableViewCell {

    @IBOutlet weak var btnPassShowHide: UIButton!
    @IBOutlet weak var imgTitleIcon: UIImageView!
    @IBOutlet weak var vwTextInputBack: UIView!
    @IBOutlet weak var lblTitke: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - clickPassShowHideBtn
    @IBAction func clickPassShowHideBtn(_ sender: Any) {
    }
    
}
