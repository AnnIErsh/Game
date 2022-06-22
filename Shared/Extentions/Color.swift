//
//  Color.swift
//  Game
//
//  Created by Anna Ershova on 17.06.2022.
//

import Foundation
import SwiftUI

#if os(macOS)
import AppKit
typealias CustomColor = NSColor
#elseif os(iOS) || os(tvOS)
import UIKit
typealias CustomColor = UIColor
#endif

extension CustomColor {
    static var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: CustomColor.colors),
                       startPoint: .bottom,
                       endPoint: .top)
    }
    
    static var text: Self {
        CustomColor(hex: 0x000000, alpha: 1) as! Self
    }
    
    static var colors: [Color] {
        [Color(CustomColor(hex: 0x856efa, alpha: 1)),
         Color(CustomColor(hex: 0x3c6eda, alpha: 1)),
         Color(CustomColor(hex: 0x877cbc, alpha: 0.5))]
    }
    
    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex >> 16) & 0xFF) / 255.0
        let green = CGFloat((hex >> 8)  & 0xFF) / 255.0
        let blue = CGFloat((hex) & 0xFF) / 255.0
        self.init(red: red, green: green , blue: blue , alpha: alpha)
    }
}
