//
//  ScreenSize.swift
//  Game
//
//  Created by Anna Ershova on 04.07.2022.
//

import Foundation
import SwiftUI

struct ScreenSize {
    #if os(iOS) || os(tvOS)
            static let size = CGSize(width: UIScreen.main.bounds.size.width,
                              height: UIScreen.main.bounds.size.height)
    #elseif os(macOS)
            static let size = CGSize(width: NSScreen.main?.visibleFrame.size.width ?? 800,
                              height: NSScreen.main?.visibleFrame.size.height ?? 600)
    #endif
}

