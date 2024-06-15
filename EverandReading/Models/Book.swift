//
//  Book.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/15/24.
//

import Foundation

enum BookType {
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
                thumbnail: "https://example.com/images/great_gatsby.jpg",
                stars: 4.5,
                author: "F. Scott Fitzgerald",
                type: .ebook
            ),
            Book(
                title: "To Kill a Mockingbird",
                thumbnail: "https://example.com/images/to_kill_a_mockingbird.jpg",
                stars: 4.8,
                author: "Harper Lee",
                type: .audiobook
            ),
            Book(
                title: "1984",
                thumbnail: "https://example.com/images/1984.jpg",
                stars: 4.6,
                author: "George Orwell",
                type: .ebook
            ),
            Book(
                title: "Pride and Prejudice",
                thumbnail: "https://example.com/images/pride_and_prejudice.jpg",
                stars: 4.7,
                author: "Jane Austen",
                type: .ebook
            ),
            Book(
                title: "The Catcher in the Rye",
                thumbnail: "https://example.com/images/catcher_in_the_rye.jpg",
                stars: 4.4,
                author: "J.D. Salinger",
                type: .audiobook
            ),
            Book(
                title: "The Lord of the Rings",
                thumbnail: "https://example.com/images/lord_of_the_rings.jpg",
                stars: 4.9,
                author: "J.R.R. Tolkien",
                type: .ebook
            ),
            Book(
                title: "Animal Farm",
                thumbnail: "https://example.com/images/animal_farm.jpg",
                stars: 4.3,
                author: "George Orwell",
                type: .audiobook
            ),
            Book(
                title: "The Hitchhiker's Guide to the Galaxy",
                thumbnail: "https://example.com/images/hitchhikers_guide.jpg",
                stars: 4.6,
                author: "Douglas Adams",
                type: .ebook
            ),
            Book(
                title: "The Chronicles of Narnia",
                thumbnail: "https://example.com/images/chronicles_of_narnia.jpg",
                stars: 4.8,
                author: "C.S. Lewis",
                type: .audiobook
            ),
            Book(
                title: "Brave New World",
                thumbnail: "https://example.com/images/brave_new_world.jpg",
                stars: 4.5,
                author: "Aldous Huxley",
                type: .ebook
            )
        ]
    }
}
