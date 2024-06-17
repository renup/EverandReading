//
//  RetryHandler.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/17/24.
//

import Foundation

protocol RetryStrategy {
    func delay(forAttempt attempt: Int, delayInSecondsFactor: Int) -> Int
}

struct FibonacciRetryStrategy: RetryStrategy {
    func delay(forAttempt attempt: Int, delayInSecondsFactor: Int) -> Int {
        if attempt <= 0 { return 0 }
        else if attempt == 1 { return delayInSecondsFactor }
        else {
            var a = 0
            var b = delayInSecondsFactor
            for _ in 2...attempt {
                let temp = a + b
                a = b
                b = temp
            }
            return b
        }
    }
}

struct ExponentialRetryStrategy: RetryStrategy {
    func delay(forAttempt attempt: Int, delayInSecondsFactor: Int) -> Int {
        return Int(pow(2.0, Double(attempt))) * delayInSecondsFactor
    }
}

struct RetryHandler {
    static func retry<T>(
        maxAttempts: Int,
        delayInSecondsFactor: Int = 1,
        maxDelayInSeconds: Int = 60, // Maximum delay limit
        strategy: RetryStrategy = FibonacciRetryStrategy(), // Default strategy
        operation: @escaping () async throws -> T
    ) async throws -> T {
        var attempts = 0
        var delay = delayInSecondsFactor
        
        while attempts < maxAttempts {
            attempts += 1
            do {
                // Check for cancellation before attempting the operation
                try Task.checkCancellation()
                
                let result: T = try await operation()
                // If the operation succeeds, return the result immediately
                return result
                
            } catch is CancellationError {
                // If a cancellation error was thrown, rethrow it to exit the retry loop
                throw CancellationError()
                
            } catch {
                // Handle other errors from the operation
                if attempts >= maxAttempts {
                    throw error
                }
                
                delay = strategy.delay(forAttempt: attempts, delayInSecondsFactor: delayInSecondsFactor)
                // Enforce the maximum delay limit
                delay = min(delay, maxDelayInSeconds)
                            
                // Check for cancellation before sleeping
                try Task.checkCancellation()
                try await Task.sleep(nanoseconds: UInt64(delay) * 1_000_000_000)
            }
        }
        
        // This code should be unreachable due to the logic above.
        // If somehow reached, it indicates a logical error.
        fatalError("Reached unreachable code. The retry loop should have exited with a result or thrown an error.")
    }
}
