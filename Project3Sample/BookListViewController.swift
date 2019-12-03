//
//  BookListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    let bookService = BookService.shared
    
    override func viewDidLoad() {
        tableView.dataSource = self
        fetchBooks()
        super.viewDidLoad()
        
    }
    func fetchBooks() {
        bookService.fetchBooks { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setImage(book: Book, bookCell: BookCell) {
        bookService.image(for: book) { (retrievedBook, image) in
            if book.id == retrievedBook.id {
                DispatchQueue.main.async {
                    bookCell.bookImage.image = image
                }
            }
        }
    }
    
    
}

extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookService.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = bookService.books[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell")!
        if let bookCell = cell as? BookCell {
            bookCell.bookTitle.text = book.title
            setImage(book: book, bookCell: bookCell)
        }
        
        return cell
    }
    
    
}
