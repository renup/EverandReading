//
//  AppTab.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/13/24.
//

import Foundation
import SwiftUI

enum AppTab: CaseIterable, Identifiable, Hashable {
    case home, topCharts, search, saved, account
   
    var id: AppTab { self }

    @ViewBuilder
    var tabLabel: some View {
        switch self {
        case .home:
            Label("Home", image: "home")
        case .topCharts:
            Label("Top Charts", image: "charts")
        case .search:
            Label("Search", image: "magnifyingglass")
        case .saved:
            Label("Saved", image: "bookmark")
        case .account:
            Label("Account", image: "person")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .home:
            HomeView()
        case .topCharts:
            TopChartsListView()
        case .search:
            SearchView()
        case .saved:
            SavedMaterialView()
        case .account:
            Profile()
        }
    }
}
