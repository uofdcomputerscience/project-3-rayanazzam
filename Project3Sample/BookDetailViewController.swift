//
//  BookDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
   
    @IBOutlet weak var ivBook: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblPublished: UILabel!
    
    var book: Book?
    var bookService: BookService?
    
    var bookTitle: String?
    override func viewDidLoad() {
        lblTitle.text = book?.title
        lblAuthor.text = book?.author
        lblPublished.text = book?.published
        
        bookService!.image(for: book!) { (retrievedBook, image) in
            if self.book!.id == retrievedBook.id {
                DispatchQueue.main.async {
                    self.ivBook.image = image
                }
            }
        }
        
        
    }
    
}
