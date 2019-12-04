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
        tableView.delegate = self
        fetchBooks()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    func fetchBooks() {
        bookService.fetchBooks { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookService.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book_c = bookService.books[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as! BookCell
        cell.config (book: book_c, service: self.bookService)
        
        return cell
    }
    
}

extension BookListViewController: UITableViewDelegate {
    
    func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = bookService.books [indexPath.item]
        let detail = storyboard?.instantiateViewController(identifier: "BookDetailViewController") as! BookDetailViewController
        detail.book = selectedRow
        detail.bookService = bookService
        
            navigationController?.pushViewController(detail, animated: true)
    }
}
