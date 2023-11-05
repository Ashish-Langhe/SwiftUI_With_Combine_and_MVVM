//
//  CreatePlaceholderError.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 06/11/23.
//

import Foundation

enum PlaceholderError: Error {
    case networkError(description: String)
    case parsingError(description: String)
}

