//
//  TopChartsListView.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/13/24.
//

import SwiftUI

struct TopChartsListView: View {
    @State var viewModel = TopChartsViewModel()
    
    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .initial, .loading:
                ProgressView()
            case .loaded:
                content
            case .error:
                ErrorView(retryClosure: viewModel.pullAllBooks)
            }
        }
        .onAppear {
            viewModel.pullAllBooks()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        VStack(spacing: 8) {
            header
            facets
            bookList
        }
        .sheet(item: $viewModel.selectedFacet) { facet in
            if facet == .formats {
                filterSheet
                    .presentationDetents([.fraction(0.3)])
            } else {
                CategoriesSheet()
                    .presentationDetents([.fraction(0.3)])
            }
        }
    }
    
    @ViewBuilder
    private var filterSheet: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Formats")
                        .font(.headline)
                    Text("Clear All")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            viewModel.selectedBookTypes = []
                            viewModel.resetFilters()
                        }
                }
                Spacer()
                Button {
                    viewModel.selectedFacet = nil
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }

            ForEach(BookType.allCases) { bookType in
                HStack {
                    Text(bookType.rawValue.capitalized)
                    Spacer()
                    Button {
                        if viewModel.selectedBookTypes.contains(bookType) {
                            viewModel.selectedBookTypes.remove(bookType)
                                           } else {
                                               viewModel.selectedBookTypes.insert(bookType)
                                           }
                    } label: {
                        Image(systemName: viewModel.selectedBookTypes.contains(bookType) ? "checkmark.square" : "square")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }

            Button {
                viewModel.resetFilters()
                viewModel.applyButtonTap = true
                viewModel.filterBooks()
                viewModel.selectedFacet = nil // change the formats facet back to its default un-tap state and close the sheet
            } label: {
                Text("Apply")
                    .font(.body)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .foregroundColor(viewModel.applyButtonTap ? Color(.systemBackground) : Color.primary)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(viewModel.applyButtonTap ? Color.primary : Color.clear)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.applyButtonTap ? Color(.systemBackground) : Color.primary, lineWidth: 1)
                    )
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .foregroundColor(Color.primary)
    }
    
    
    @ViewBuilder
    private var header: some View {
        VStack(spacing: 8) {
            Text("Top Charts")
                .font(.title)
            
            HStack {
                Text("The most popular books and audio books generating buzz from critics, NYT, and more")
                    .font(.body)
                Spacer()
            }
        }
        .foregroundColor(Color.primary)
        .padding()
    }
    
    private var facets: some View {
        HStack(spacing: 8) {
            ForEach(Facets.allCases) { facet in
                Button {
                    viewModel.applyButtonTap = false
                    viewModel.selectedFacet = facet
                } label: {
                    Text(facet.rawValue.capitalized)
                        .font(.body)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(viewModel.selectedFacet == facet ? Color.primary : Color.clear)
                        )
                        .foregroundColor(viewModel.selectedFacet == facet ? Color(.systemBackground) : Color.primary)
                        .overlay(
                            Capsule()
                                .stroke(Color.primary, lineWidth: 1)
                        )
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    @ViewBuilder
    private var bookList: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 16) {
                ForEach(Array(viewModel.showBooks().enumerated()), id: \.element.id) { index, book in
                    HStack(alignment: .top, spacing: 16) {
                        Text("\(index + 1).")
                            .font(.headline)
                            .frame(width: 30)
                        
                        AsyncImage(url: URL(string: book.thumbnail)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 120)
                                .cornerRadius(10)
                        } placeholder: {
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.2))
                                .frame(width: 80, height: 120)
                                .cornerRadius(10)
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
