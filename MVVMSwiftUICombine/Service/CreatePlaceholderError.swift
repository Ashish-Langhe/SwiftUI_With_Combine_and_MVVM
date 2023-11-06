//
//  CreatePlaceholderError.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 06/11/23.
//

import Foundation

// Define an enum called PlaceholderError that conforms to the Error protocol.
enum PlaceholderError: Error {
    // Define a networkError case for representing errors related to network issues.
    case networkError(description: String)
    
    // Define a parsingError case for representing errors related to data parsing or decoding.
    case parsingError(description: String)
}

