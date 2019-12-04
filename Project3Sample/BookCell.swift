//
//  BookCell.swift
//  Project3Sample
//
//  Created by Rayan Ahmed on 12/2/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    
    
    func config (book: Book, service: BookService) {
        self.bookTitle.text = book.title
        setImage (book_c: book, service_c: service)
    }
    
    func setImage(book_c: Book, service_c: BookService) {
        service_c.image(for: book_c) { (retrievedBook, image) in
            if book_c.id == retrievedBook.id {
                DispatchQueue.main.async {
                    self.bookImage.image = image
                }
            }
        }
    }
}
