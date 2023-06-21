//
//  Book.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI

struct Book: Identifiable {
    let id = UUID().uuidString
    let title: String
    let author: String
    let rating: Int
    let bookViews: Int
    let imageName: String
    var detailText: String
    var about: String
    let pdfURL: URL?
    let buyURL: URL? // Added the 'about' property to the Book struct
}

let sampleBooks: [Book] = [
    Book(title: "Why Men Don't Cheat", author: "The Shiba Billionaire", rating: 4, bookViews: 1000, imageName: "book1", detailText: "Explore the transformative journey of a former cheater as he unveils the hidden reasons behind infidelity. Delve into the complexities of relationships and gain valuable insights into the male perspective on cheating. An essential read for those seeking understanding and building stronger, faithful connections.", about: "About Book 1", pdfURL: URL(string: "https://bossnationapp.com/wp-content/uploads/2023/06/724E334D-9C1F-48B5-963F-A30EE5791062.pdf")!, buyURL: URL(string: "https://bossnationapp.com/?p=5890")!),
    Book(title: "Book 2", author: "Author 2", rating: 4, bookViews: 800, imageName: "Book 2", detailText: "Detail text for Book 2", about: "About Book 2", pdfURL: URL(string: "https://example.com/book2.pdf")!, buyURL: URL(string: "https://example.com/buy/book1")!),
    Book(title: "Book 3", author: "Author 2", rating: 4, bookViews: 800, imageName: "Book 3", detailText: "Detail text for Book 3", about: "About Book 3", pdfURL: URL(string: "https://example.com/book3.pdf")!, buyURL: URL(string: "https://example.com/buy/book1")!),
    Book(title: "Book 4", author: "Author 2", rating: 4, bookViews: 800, imageName: "Book 4", detailText: "Detail text for Book 4", about: "About Book 4", pdfURL: URL(string: "https://example.com/book4.pdf")!, buyURL: URL(string: "https://example.com/buy/book1")!),
    Book(title: "Book 5", author: "Author 2", rating: 4, bookViews: 800, imageName: "Book 5", detailText: "Detail text for Book 5", about: "About Book 5", pdfURL: URL(string: "https://example.com/book5.pdf")!, buyURL: URL(string: "https://example.com/buy/book1")!),
]


