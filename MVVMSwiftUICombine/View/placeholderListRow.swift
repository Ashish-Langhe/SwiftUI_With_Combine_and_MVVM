//
//  placeholderListRow.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 06/11/23.
//

import SwiftUI

struct PlaceholderListRow: View {
    
    let item: PlaceholderResponseModelElement
    
    var body: some View {
        HStack {
            VStack {
                Text(item.title)
                    .font(.title) // Use .title for the title text
                    .foregroundStyle(.red)
                Spacer()
                Text(item.body)
                    .font(.body) // Use .body for the body text
            }
        }
    }
}

struct PlaceholderListRow_Previews: PreviewProvider {
   
    static var previews: some View {
        PlaceholderListRow(item: PlaceholderResponseModelElement(userID: 1, id: 1, title: "dummy text", body: "dummy body"))
    }
}
