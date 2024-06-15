//
//  AppTabView.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/13/24.
//

import SwiftUI

struct AppTabView: View {
    @State private var appScreenController = AppScreenController()

    var body: some View {
        TabView(selection: Bindable( appScreenController).selection)  {
            ForEach(AppTab.allCases) { screen in
                screen.destination
                    .tabItem {  screen.tabLabel }
                    .tag(screen as AppTab)
            }
        }
    }
}

#Preview {
    AppTabView()
}
