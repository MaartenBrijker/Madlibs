//
//  StoryCell.swift
//  Madlibs
//
//  Created by Maarten Brijker on 22/04/16.
//  Copyright © 2016 Maarten_Brijker. All rights reserved.
//

import UIKit

class StoryCell: UITableViewCell {

    @IBOutlet weak var storyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
