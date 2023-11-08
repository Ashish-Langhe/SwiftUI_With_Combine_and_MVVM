//
//  ContentServiceProtocol.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 08/11/23.
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
