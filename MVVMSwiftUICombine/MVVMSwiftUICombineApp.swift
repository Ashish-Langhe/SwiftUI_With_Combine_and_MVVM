//
//  MVVMSwiftUICombineApp.swift
//  MVVMSwiftUICombine
//
//  Created by Ashish Langhe on 03/11/23.
//

import SwiftUI

@main
struct MVVMSwiftUICombineApp: App {
    @StateObject private var viewModel: ContentViewModel

    init() {
        let service = ContentService()
        self._viewModel = StateObject(wrappedValue: ContentViewModel(service: service))
    }

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}

