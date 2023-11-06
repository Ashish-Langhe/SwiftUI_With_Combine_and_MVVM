//
//  PlaceholderResponseModel.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 05/11/23.
//

import Foundation

// MARK: - PlaceholderResponseModelElement
// Define a structure named PlaceholderResponseModelElement that conforms to Codable and Identifiable protocols.
struct PlaceholderResponseModelElement: Codable, Identifiable {
    let userID, id: Int
    let title, body: String

    // Define an enumeration named CodingKeys that conforms to String and CodingKey protocols.
    enum CodingKeys: String, CodingKey {
        // Map the "userId" key from the JSON to the userID property.
        case userID = "userId"
        // Map the "id" key from the JSON to the id property.
        case id, title, body
    }
}

// Define a typealias named PlaceholderResponseModel, which is an array of PlaceholderResponseModelElement.
typealias PlaceholderResponseModel = [PlaceholderResponseModelElement]
