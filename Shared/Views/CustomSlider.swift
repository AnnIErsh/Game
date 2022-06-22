//
//  CustomSlider.swift
//  Game
//
//  Created by Anna Ershova on 22.06.2022.
//

import SwiftUI

protocol ISlider {
    associatedtype SliderType
    associatedtype Actions
    static func produce(value: Binding<Float>,
                        isEditing: Actions) -> SliderType
}

struct CustomSlider: ISlider {
    static func produce(value: Binding<Float>, isEditing: @escaping (Bool) -> Void) -> AnyView {
        #if os(iOS) || os(macOS)
        Slider(value: value, in: 0...100, onEditingChanged: isEditing).toAnyView()
        #elseif os(tvOS)
        @State var num: Int = Int(value.wrappedValue)
        return Text("\(num)").toAnyView()
        #endif
    }
}
