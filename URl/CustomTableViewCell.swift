//
//  CustomTableViewCell.swift
//  URl
//
//  Created by Nathaniel Whittington on 3/23/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var ImagePic: UIImageView!
    @IBOutlet weak var LabelView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
