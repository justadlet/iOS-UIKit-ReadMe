//
//  Book.swift
//  ReadMe
//
//  Created by Adlet Zeineken on 22.12.2020.
//  Copyright © 2020 justadlet. All rights reserved.
//

import UIKit

struct Book {
    let title: String
    let author: String
    var review: String?  
    
    var image: UIImage {
        Library.loadImage(forBook: self)
        ?? LibrarySymbol.letterSquare(letter: title.first).image
    }
}
