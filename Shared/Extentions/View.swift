//
//  View.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import Foundation
import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
        
    }
    
    var body: Content {
        build()
    }
}

extension View {
    var lazy: some View {
        LazyView(self)
    }
    
    func toAnyView() -> AnyView {
        AnyView(self)
    }

    @ViewBuilder
    func showMenu(isPresented: Binding<Bool>, selected: Binding<Mode>) -> some View {
        let screen = MenuScreen(selected: selected).lazy.toAnyView
        #if os(iOS) || os(tvOS)
        fullScreenCover(isPresented: isPresented, content: screen)
        #elseif os(macOS)
        popover(isPresented: $isPresented, content: screen)
        #endif
    }
}

