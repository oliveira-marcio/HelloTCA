//
//  HelloTCAApp.swift
//  HelloTCA
//
//  Created by Márcio Oliveira on 11/07/2023.
//

import SwiftUI
import ComposableArchitecture

@main
struct HelloTCAApp: App {
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }

    var body: some Scene {
        WindowGroup {
            CounterView(store: HelloTCAApp.store)
        }
    }
}
