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
    }
}
