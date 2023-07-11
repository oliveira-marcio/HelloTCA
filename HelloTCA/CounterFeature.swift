//
//  CounterFeature.swift
//  HelloTCA
//
//  Created by Márcio Oliveira on 11/07/2023.
//

import ComposableArchitecture

struct CounterFeature: ReducerProtocol {
    struct State {
        var count = 0
    }

    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .decrementButtonTapped: state.count += 1
        case .incrementButtonTapped: state.count -= 1
        }
        return .none
    }
}
