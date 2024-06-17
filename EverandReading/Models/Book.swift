//
//  Book.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/15/24.
//

import Foundation

enum BookType: String, CaseIterable, Hashable, Identifiable {
    var id: BookType { return self }
    
    case ebook, audiobook
}

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let thumbnail: String
    let stars: Float
    let author: String
    let type: BookType
    
    init(title: String, thumbnail: String, stars: Float, author: String, type: BookType) {
        self.title = title
        self.thumbnail = thumbnail
        self.stars = stars
        self.author = author
        self.type = type
    }
}

extension Book {
    static func sampleData() -> [Book] {
        return [
            Book(
                title: "The Great Gatsby",
                thumbnail: "https://m.media-amazon.com/images/I/51vv75oglyL.jpg",
                stars: 4.5,
                author: "F. Scott Fitzgerald",
                type: .ebook
            ),
            Book(
                title: "To Kill a Mockingbird",
                thumbnail: "https://m.media-amazon.com/images/I/51IXWZzlgSL.jpg",
                stars: 4.8,
                author: "Harper Lee",
                type: .audiobook
            ),
            Book(
                title: "1984",
                thumbnail: "https://m.media-amazon.com/images/I/41-ff9VjOlL.jpg",
                stars: 4.6,
                author: "George Orwell",
                type: .ebook
            ),
            Book(
                title: "Pride and Prejudice",
                thumbnail: "https://m.media-amazon.com/images/I/41s7Nl3cXXL.jpg",
                stars: 4.7,
                author: "Jane Austen",
                type: .ebook
            ),
            Book(
                title: "The Catcher in the Rye",
                thumbnail: "https://m.media-amazon.com/images/I/511BDFArolL.jpg",
                stars: 4.4,
                author: "J.D. Salinger",
                type: .audiobook
            ),
            Book(
                title: "The Lord of the Rings",
                thumbnail: "https://m.media-amazon.com/images/I/51EstVXM1UL._SX331_BO1,204,203,200_.jpg",
                stars: 4.9,
                author: "J.R.R. Tolkien",
                type: .ebook
            ),
            Book(
                title: "Animal Farm",
                thumbnail: "https://m.media-amazon.com/images/I/41aT40LhqQL.jpg",
                stars: 4.3,
                author: "George Orwell",
                type: .audiobook
            ),
            Book(
                title: "The Hitchhiker's Guide to the Galaxy",
                thumbnail: "https://m.media-amazon.com/images/I/51MzUz8rQcL.jpg",
                stars: 4.6,
                author: "Douglas Adams",
                type: .ebook
            ),
            Book(
                title: "The Chronicles of Narnia",
                thumbnail: "https://m.media-amazon.com/images/I/51B7Xf9Xb-L.jpg",
                stars: 4.8,
                author: "C.S. Lewis",
                type: .audiobook
            ),
            Book(
                title: "Brave New World",
                thumbnail: "https://m.media-amazon.com/images/I/41-n7Txgs1L.jpg",
                stars: 4.5,
                author: "Aldous Huxley",
                type: .ebook
            ),
            Book(
                title: "The Handmaid's Tale",
                thumbnail: "https://m.media-amazon.com/images/I/41l2PrOojVL.jpg",
                stars: 4.4,
                author: "Margaret Atwood",
                type: .ebook
            ),
            Book(
                title: "The Hunger Games",
                thumbnail: "https://m.media-amazon.com/images/I/41gCCCrVRdL.jpg",
                stars: 4.7,
                author: "Suzanne Collins",
                type: .audiobook
            ),
            Book(
                title: "The Da Vinci Code",
                thumbnail: "https://m.media-amazon.com/images/I/51MDLTJcWbL.jpg",
                stars: 4.2,
                author: "Dan Brown",
                type: .ebook
            ),
            Book(
                title: "The Girl with the Dragon Tattoo",
                thumbnail: "https://m.media-amazon.com/images/I/51EzrauCJaL.jpg",
                stars: 4.5,
                author: "Stieg Larsson",
                type: .audiobook
            ),
            Book(
                title: "The Kite Runner",
                thumbnail: "https://m.media-amazon.com/images/I/51vRNqL61aL.jpg",
                stars: 4.6,
                author: "Khaled Hosseini",
                type: .ebook
            ),
            Book(
                title: "The Picture of Dorian Gray",
                thumbnail: "https://m.media-amazon.com/images/I/51kqFTH4xtL.jpg",
                stars: 4.4,
                author: "Oscar Wilde",
                type: .ebook
            ),
            Book(
                title: "The Road",
                thumbnail: "https://m.media-amazon.com/images/I/51A6N8mCvWL.jpg",
                stars: 4.3,
                author: "Cormac McCarthy",
                type: .audiobook
            ),
            Book(
                title: "The Alchemist",
                thumbnail: "https://m.media-amazon.com/images/I/516c6gUQLaL.jpg",
                stars: 4.7,
                author: "Paulo Coelho",
                type: .ebook
            ),
            Book(
                title: "The Hobbit",
                thumbnail: "https://m.media-amazon.com/images/I/51uLvJlKpNL._SX331_BO1,204,203,200_.jpg",
                stars: 4.8,
                author: "J.R.R. Tolkien",
                type: .audiobook
            ),
            Book(
                title: "The Martian",
                thumbnail: "https://m.media-amazon.com/images/I/51dFpo9h0JL.jpg",
                stars: 4.6,
                author: "Andy Weir",
                type: .ebook
            )
        ]
    }
}
