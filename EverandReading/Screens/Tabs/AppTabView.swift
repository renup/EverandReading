//
//  AppTabView.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/13/24.
//

import SwiftUI

@Observable
final class AppScreenController: Sendable {
    var selection: AppTab = .topCharts
}

struct AppTabView: View {
    @State private var appScreenController = AppScreenController()

    var body: some View {
        TabView(selection: $appScreenController.selection) {
            ForEach(AppTab.allCases) { screen in
                screen.destination
                    .tabItem { screen.tabLabel }
                    .tag(screen)
            }
        }
        .environment(appScreenController)
    }
}

#Preview {
    AppTabView()
        .environment(AppScreenController())
}
