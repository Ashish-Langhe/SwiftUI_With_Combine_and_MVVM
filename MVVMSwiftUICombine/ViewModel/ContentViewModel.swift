//
//  ContentViewModel.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 05/11/23.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    // An array of PlaceholderResponseModel to hold fetched data.
    @Published var arrayItems: PlaceholderResponseModel = []

    // A set to manage Combine cancellables for subscriptions.
    var cancellable = Set<AnyCancellable>()

    // The service responsible for fetching data, adhering to the ContentServiceProtocol.
    let service: ContentServiceProtocol

    // Initialize the view model with a service and immediately fetch data.
    init(service: ContentServiceProtocol) {
        self.service = service
        getServerData()
    }

    // Fetch data from the service and update the arrayItems.
    func getServerData() {
        service.getPlaceholderData()
            .sink { completion in
                // Handle the completion of the data fetch operation.
                switch completion {
                case .failure(let error):
                    // If there's an error, print an error message.
                    print("Error:", error)
                case .finished:
                    // If the operation is finished, print a completion message.
                    print("completion")
                }
            } receiveValue: { [weak self] response in
                // When data is received, update the arrayItems with the response.
                self?.arrayItems = response
            }
            .store(in: &cancellable) // Store the subscription in the cancellable set.
    }

    // Add sample data manually to arrayItems.
    func getData() {
        // Create a PlaceholderResponseModelElement and append it to the arrayItems.
        let item = PlaceholderResponseModelElement(userID: 1, id: 1, title: "test", body: "test description")
        arrayItems.append(item)
        
        // Create another PlaceholderResponseModelElement and append it as well.
        let item2 = PlaceholderResponseModelElement(userID: 2, id: 2, title: "test_1", body: "test description_1")
        arrayItems.append(item2)
    }
}
