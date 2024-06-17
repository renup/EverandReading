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
    var selectedFacet: Facets?

    init(topChartsRepository: TopChartsRepository = DefaultTopChartsRepository.shared) {
        self.topChartsRepository = topChartsRepository
    }
    
    func pullAllBooks() {
        state = .loading
        Task { [weak self] in
            guard let self = self else { return }
            do {
                let books = try await self.topChartsRepository.fetchTopCharts()
                await MainActor.run {
                    self.books = books
                    self.state = .loaded
                }
            } catch {
                do {
                    try await RetryHandler.retry(maxAttempts: 2) { [weak self] in
                        guard let self = self else { throw CancellationError() }
                        let books = try await self.topChartsRepository.fetchTopCharts()
                        await MainActor.run {
                            self.books = books
                            self.state = .loaded
                        }
                    }
                } catch {
                    await MainActor.run {
                        self.state = .error
                    }
                }
            }
        }
    }
    func showBooks() -> [Book] {
        if selectedBookTypes.count >= 1 && applyButtonTap {
            return filteredBooks
        } else if selectedBookTypes.count >= 1 && selectedFacet == nil { // there is some filter selection but the "x" button on the sheet is pressed.
            filterBooks() // reset the filteredBooks array in case the selection is changed
            return filteredBooks
        }
        return books
    }
    
    func filterBooks() {
        filteredBooks = books.filter { book in
            selectedBookTypes.contains(book.type)
        }
    }
    
    func resetFilters() {
        filteredBooks = []
        applyButtonTap = false
    }
}
