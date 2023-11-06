//
//  ContentView.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 03/11/23.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationView{
            List {
                listSection
            }
            .navigationTitle("Content List")
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(service: ContentService()))
}

private extension ContentView {
    var listSection: some View {
        Section {
            ForEach(viewModel.arrayItems) { item in
                PlaceholderListRow(item: item)
            }
        }
    }
}
