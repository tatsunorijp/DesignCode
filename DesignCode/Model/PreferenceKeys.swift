//
//  PreferenceKeys.swift
//  DesignCode
//
//  Created by Wellington Tatsunori Asahide on 01/04/22.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
