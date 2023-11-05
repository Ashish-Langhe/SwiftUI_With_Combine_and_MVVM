//
//  placeholderListRow.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 06/11/23.
//

import SwiftUI

struct placeholderListRow: View {
    
    let item: PlaceholderResponseModelElement
    
    var body: some View {
        HStack {
            VStack {
                Text(item.title)
                    .font(.title)
                    .foregroundStyle(.red)
                Spacer()
                Text(item.body)
                    .font(.title)
            }
        }
    }
}

struct placeholderListRow_Previews:  PreviewProvider{
   
    static var previews: some View {
        placeholderListRow(item: PlaceholderResponseModelElement(userID: 1, id: 1, title: "dummy text", body: "dummy body"))
    }
    
    
}
