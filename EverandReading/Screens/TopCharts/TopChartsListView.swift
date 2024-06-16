//
//  TopChartsListView.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/13/24.
//

import SwiftUI

struct TopChartsListView: View {
    @State var viewModel = TopChartsViewModel()
    let imageDomain = "https://example.com/images/"
    
    var body: some View {
        VStack {
            header
            facets
            bookList
        }
        .onAppear {
            viewModel.pullAllBooks()
        }
    }
    
    @ViewBuilder
    private var header: some View {
        VStack {
            Text("Top Charts")
            Text("The most popular books and audio books generating buzz from critics, NYT, and more")
        }
    }
    
    private var facets: some View {
        HStack(spacing: 8) {
            ForEach(Facets.allCases) { facet in
                Button {
                    print("facet tapped")
                } label: {
                    Text(facet.rawValue.capitalized)
                }
                .clipShape(Capsule())
            }
        }
    }
    
    @ViewBuilder
    private var bookList: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                ForEach(Array(viewModel.books.enumerated()), id: \.element.id) { index, book in
                    HStack(alignment: .top, spacing: 16) {
                        Text("\(index + 1).")
                            .font(.headline)
                            .frame(width: 30)
                        
                        AsyncImage(url: URL(string: imageDomain + book.thumbnail)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 120)
                        } placeholder: {
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.2))
                                .frame(width: 80, height: 120)
                        }
                        
                        bookDetails(book)
                        
                        Spacer()
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func bookDetails(_ book: Book) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(book.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    print("book mark tap for book = \(book.title)")
                } label: {
                    Image(systemName: "bookmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
            }
            
            Text(book.author)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                ForEach(0..<5) { index in
                    Image(systemName: index < Int(book.stars) ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}
#Preview {
    TopChartsListView()
}
