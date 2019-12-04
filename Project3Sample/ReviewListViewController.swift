//
//  ReviewListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewListViewController: UIViewController {
    
    @IBOutlet weak var tvReviews: UITableView!
    let reviewService = ReviewService.shared
    
    override func viewDidLoad() {
        fetchReviews()
        tvReviews.dataSource = self
        tvReviews.delegate = self
    }
    
    func fetchReviews () {
        reviewService.fetchReviews { [weak self] in
            DispatchQueue.main.async {
                self?.tvReviews.reloadData()
            }
        }
    }
    
}

extension ReviewListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviewService.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let review_c = reviewService.reviews[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell") as! ReviewCell
        cell.config(review: review_c)
        return cell
    }
}

extension ReviewListViewController: UITableViewDelegate {
    func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = reviewService.reviews [indexPath.item]
        let detail = storyboard?.instantiateViewController(identifier: "ReviewDetailViewController") as! ReviewDetailViewController
        detail.review = selectedRow
        
            navigationController?.pushViewController(detail, animated: true)
    }
}
