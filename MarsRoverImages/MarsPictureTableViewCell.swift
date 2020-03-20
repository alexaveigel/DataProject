//
//  MarsPictureTableViewCell.swift
//  MarsRoverImages
//
//  Created by Alexa Veigel on 3/19/20.
//  Copyright © 2020 Alexa Veigel. All rights reserved.
//

import UIKit

class MarsPictureTableViewCell: UITableViewCell {


    @IBOutlet weak var imgMars: UIImageView!
    @IBOutlet weak var lblRover: UILabel!
    @IBOutlet weak var lblCamera: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
