//
//  TopChartsRepository.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/15/24.
//

import Foundation

protocol TopChartsRepository {
    func fetchTopCharts() async throws -> [Book]
}

class DefaultTopChartsRepository: TopChartsRepository {
    static let shared = DefaultTopChartsRepository()
    
    func fetchTopCharts() async throws -> [Book] {
        try await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds delay

        // TODO: uncomment this after finishing the task
//        if Bool.random() {
//            throw URLError(.badServerResponse)
//        }
        
        return Book.sampleData()
    }
        
}