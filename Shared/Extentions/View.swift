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
}

