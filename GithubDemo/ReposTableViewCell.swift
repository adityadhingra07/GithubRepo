//
//  ReposTableViewCell.swift
//  GithubDemo
//
//  Created by Deep S Randhawa on 2/16/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class ReposTableViewCell: UITableViewCell {

    // OUTLETS
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var avatarUIImage: UIImageView!
    @IBOutlet weak var numStarsLabel: UILabel!
    @IBOutlet weak var numForksLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
