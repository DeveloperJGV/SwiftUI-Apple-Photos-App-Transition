//
//  HeroKey.swift
//  Photos App Transition
//
//  Created by User on 08/05/24.
//

import SwiftUI

struct HeroKey: PreferenceKey {
    static var defaultValue: [String: Anchor<CGRect>] = [:]
    static func reduce(value: inout [String : Anchor<CGRect>], nextValue: () -> [String : Anchor<CGRect>]) {
        value.merge(nextValue()) {$1}
    }
}
