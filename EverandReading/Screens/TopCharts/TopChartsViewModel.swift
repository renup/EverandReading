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
    
    init(topChartsRepository: TopChartsRepository = DefaultTopChartsRepository.shared) {
        self.topChartsRepository = topChartsRepository
    }
    
    func pullAllBooks() {
        state = .loading
        Task {
            do {
                let books = try await topChartsRepository.fetchTopCharts()
                self.books = books
                state = .loaded
            } catch {
                state = .error
            }
        }
    }
}
