//
//  PlaceholderResponseModel.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 05/11/23.
//

import Foundation

// MARK: - PlaceholderResponseModelElement
struct PlaceholderResponseModelElement: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PlaceholderResponseModel = [PlaceholderResponseModelElement]
