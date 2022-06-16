//
//  ContainerScreen.swift
//  Game
//
//  Created by Anna Ershova on 16.06.2022.
//

import SwiftUI
import Navigation

struct ContainerScreen: View {
    @Binding var selected: Mode
    @ObservedObject var type = TypeViewModel()
    @EnvironmentObject var route: NavigationViewModel
    
    var screen: AnyView {
        get { type.makeScreen(selected).lazy.toAnyView() }
    }
    
    var body: some View {
        screen
    }
}
