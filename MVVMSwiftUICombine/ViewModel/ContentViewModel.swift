//
//  ContentViewModel.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 05/11/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var arrayItems: PlaceholderResponseModel = []
    
    init (){
        getData()
    }
    
    func getData(){
        let item = PlaceholderResponseModelElement(userID: 1, id: 1, title: "test", body: "test description")
        arrayItems.append(item)
        let item2 = PlaceholderResponseModelElement(userID: 2, id: 2, title: "test_1", body: "test description_1")
        arrayItems.append(item2)
    }
}
