//
//  TopChartsViewModel.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/15/24.
//

import Foundation

enum AsyncState {
    case initial, loading, loaded, error
}

enum Facets: String, CaseIterable, Hashable, Identifiable {
    var id: Facets {
        return self
    }
    
    case formats, categories
}

@Observable
class TopChartsViewModel {
    var books = [Book]()
    let topChartsRepository: TopChartsRepository
    var state: AsyncState = .initial
    var filteredBooks: [Book] = []
    var selectedBookTypes: Set<BookType> = []
    var applyButtonTap = false
    
    init(topChartsRepository: TopChartsRepository = DefaultTopChartsRepository.shared) {
        self.topChartsRepository = topChartsRepository
    }
    
    func pullAllBooks() {
        state = .loading
        Task {
            do {
                let books = try await topChartsRepository.fetchTopCharts()
                await MainActor.run {
                    self.books = books
                    state = .loaded
                }
            } catch {
                await MainActor.run {
                    state = .error
                }
            }
        }
    }
    
    func showBooks() -> [Book] {
        if selectedBookTypes.count >= 1 && applyButtonTap {
            return filteredBooks
        }
        return books
    }
    
    func filterBooks() {
        var result = [Book]()
        for ele in selectedBookTypes {
            result.append(contentsOf: books.filter { $0.type == ele })
        }
       filteredBooks = result
    }
    
    func resetFilters() {
        filteredBooks = []
        applyButtonTap = false
    }
}
