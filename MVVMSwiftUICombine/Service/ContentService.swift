//
//  ContentService.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 06/11/23.
//

import Foundation
import Combine

/** 
A protocol, `ContentServiceProtocol`, is defined to establish a contract for services that fetch placeholder data.
 
By adhering to this protocol, classes like `ContentService` can provide an implementation for fetching data while promoting clean architecture through dependency injection.

This enables the injection of different service implementations into view models, promoting testability and flexibility in the application's data retrieval process. **/

protocol ContentServiceProtocol {
    func getPlaceholderData() -> Future<PlaceholderResponseModel, PlaceholderError>
}

// Implement the ContentService class that conforms to the ContentServiceProtocol.
class ContentService: ContentServiceProtocol {
    // A set to hold Combine cancellables for managing subscriptions.
    var cancellable = Set<AnyCancellable>()

    // Implement the method required by the ContentServiceProtocol to fetch placeholder data.
    func getPlaceholderData() -> Future<PlaceholderResponseModel, PlaceholderError> {
        // Create and return a Combine Future that encapsulates the asynchronous operation.
        return Future { promise in
            // Construct a URL for the API endpoint.
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
                // If the URL is invalid, immediately provide a network error using the promise.
                return promise(.failure(.networkError(description: "Invalid URL")))
            }

            // Use URLSession to initiate a data task for the specified URL.
            URLSession.shared.dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main) // Receive and handle events on the main thread.
                .tryMap { (data, response) in
                    // Ensure the HTTP response status code is within the success range (200-300).
                    guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 300 else {
                        // If the response is not within the success range, throw a network error.
                        throw PlaceholderError.networkError(description: "Invalid Response")
                    }
                    return data
                }
                .decode(type: PlaceholderResponseModel.self, decoder: JSONDecoder()) // Decode JSON data.
                .sink { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case _ as DecodingError:
                            // If a decoding error occurs, provide a parsing error using the promise.
                            promise(.failure(.parsingError(description: "Failed to parse data")))
                        default:
                            // For other errors, indicate a network error.
                            promise(.failure(.networkError(description: "Failed to get data")))
                        }
                    }
                } receiveValue: { response in
                    // If data is successfully received and decoded, provide the response using the promise.
                    promise(.success(response))
                }
                .store(in: &self.cancellable) // Store the subscription in the cancellable set.
        }
    }
}
