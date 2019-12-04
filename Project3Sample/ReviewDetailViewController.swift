//
//  ReviewDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewDetailViewController: UIViewController {
    
    @IBOutlet weak var tvBody: UITextView!
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var tvReviewer: UILabel!
    
    var review: Review?
    
    override func viewDidLoad() {
        tvBody.text = review?.body
        tvTitle.text = review?.title
        tvReviewer.text = review?.reviewer
    }
    
}
