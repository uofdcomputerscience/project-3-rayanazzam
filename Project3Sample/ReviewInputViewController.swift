//
//  ReviewInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewInputViewController: UIViewController {
    
    @IBOutlet weak var tfReviewer: UITextField!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tvBody: UITextView!
    @IBOutlet weak var tfBookId: UITextField!
    
    let reviewService = ReviewService.shared
    
    override func viewDidLoad() {
        
    }
    func inputsAreValid (text1: String, text2: String, text3: String, text4: String) -> Bool {
        if  text1.isEmpty ||
            text2.isEmpty ||
            text3.isEmpty ||
            text4.isEmpty {
            return false
        }
        return true
    }
    
    func clearTextFields() {
        tfReviewer.text = ""
        tfTitle.text = ""
        tvBody.text = ""
        tfBookId.text = ""
    }
    
    func postReview (review: Review) {
        reviewService.createReview(review: review) {
            print("Creating review ...")
        }
    }
    
    @IBAction func submitReview(_ sender: Any) {
        if inputsAreValid (text1: String (tfReviewer.text!),
                           text2: String (tfTitle.text!),
                           text3: String (tvBody.text!),
                           text4: String (tfBookId.text!)) {
           
            postReview (review: Review (id: nil,
                                        bookId: Int (String (tfBookId!.text!))!,
                                        date: nil,
                                        reviewer: String(tfReviewer.text!), title: String (tfTitle.text!),
                                        body: String(tvBody.text!)))
            
            let controller = UIAlertController(title: "Success", message: "You have posted your review!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
                    self.dismiss(animated: true, completion: nil)
            }
            controller.addAction(okAction)
            present(controller, animated: true)
            
            clearTextFields()
            
        } else {
            let controller = UIAlertController(title: "An error occurred", message: "Please give valid inputs!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
                    self.dismiss(animated: true, completion: nil)
            }
            controller.addAction(okAction)
            present(controller, animated: true)
        }
    }
}
