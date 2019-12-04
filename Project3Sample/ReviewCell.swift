//
//  ReviewCell.swift
//  Project3Sample
//
//  Created by Rayan Ahmed on 12/3/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    
    func config (review: Review) {
        lblTitle.text = review.reviewer + "'s review on" + review.title
    }
}
