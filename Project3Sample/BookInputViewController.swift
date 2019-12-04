//
//  BookInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookInputViewController: UIViewController {
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfPublishDate: UITextField!
    @IBOutlet weak var tfAuthor: UITextField!
    @IBOutlet weak var tfImageUrl: UITextField!
    
    let bookService = BookService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfTitle.delegate = self
        tfAuthor.delegate = self
        tfPublishDate.delegate = self
        tfImageUrl.delegate = self
    }
    
    @IBAction func submitBook(_ sender: Any) {
        if inputsAreValid (text1: String (tfTitle.text!),
                           text2: String (tfAuthor.text!),
                           text3: String (tfPublishDate.text!),
                            text4: String (tfImageUrl.text!) ) {
           
            postBook (book: Book(id: nil, title: String (tfTitle.text!),
                             author: String (tfAuthor.text!),
                             published: String (tfPublishDate.text!),
                             imageURLString: String (tfImageUrl.text!)))
            
            let controller = UIAlertController(title: "Success", message: "You have posted your book!", preferredStyle: .alert)
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
    
    func postBook(book: Book) {
        bookService.createBook(book: book) {
            print("book created")
        }
    }
    
    func inputsAreValid (text1: String, text2: String, text3: String, text4: String) -> Bool {
        if text1.isEmpty || text2.isEmpty || text3.isEmpty || text4.isEmpty {
            return false
        }
        return true
    }
    
    func clearTextFields() {
        tfTitle.text = ""
        tfAuthor.text = ""
        tfPublishDate.text = ""
        tfImageUrl.text = ""
    }
}

extension BookInputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         if textField == tfTitle {
            tfAuthor.becomeFirstResponder()
         }
         if textField == tfAuthor {
            tfPublishDate.becomeFirstResponder()
         }
         if textField == tfPublishDate {
            tfImageUrl.becomeFirstResponder()
         }
         return true
    }
}
