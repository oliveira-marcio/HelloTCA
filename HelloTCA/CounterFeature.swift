//
//  CounterFeature.swift
//  HelloTCA
//
//  Created by Márcio Oliveira on 11/07/2023.
//

import Foundation
import ComposableArchitecture

struct CounterFeature: ReducerProtocol {
    struct State {
        var count = 0
        var fact: String?
        var isLoading = false
    }

    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case factButtonTapped
        case factResponse(String)
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .decrementButtonTapped:
            state.count -= 1
            state.fact = nil
            return .none

        case .incrementButtonTapped:
            state.count += 1
            state.fact = nil
            return .none

        case .factButtonTapped:
            state.fact = nil
            state.isLoading = true
            return .run { [count = state.count] send in
                let (data, _) = try await URLSession.shared
                    .data(from: URL(string: "http://numbersapi.com/\(count)")!)
                let fact = String(decoding: data, as: UTF8.self)
                await send(.factResponse(fact))
            }

        case let .factResponse(fact):
              state.fact = fact
              state.isLoading = false
              return .none
        }
    }
}

extension CounterFeature.State: Equatable {}
