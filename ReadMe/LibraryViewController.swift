//
//  ViewController.swift
//  ReadMe
//
//  Created by Adlet Zeineken on 22.12.2020.
//  Copyright © 2020 justadlet. All rights reserved.
//

import UIKit

class LibraryViewController: UITableViewController {

    @IBSegueAction func showDetailView(_ coder: NSCoder) -> DetailViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else { fatalError("Nothing selected!") }
        let book = Library.books[indexPath.row - 1]
        return DetailViewController(coder: coder, book: book)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Library.books.count + 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewBookCell", for: indexPath)
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BookCell.self)", for: indexPath) as? BookCell
                else {
                    fatalError("Could not create BookCell")
                }
            let book = Library.books[indexPath.row - 1]
            cell.titleLabel?.text = book.title
            cell.bookThumbnail?.image = book.image
            cell.authorLabel?.text = book.author
            cell.bookThumbnail.layer.cornerRadius = 12
            return cell
        }
    }
}
