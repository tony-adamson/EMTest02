//
//  ContentView.swift
//  EMTest02
//
//  Created by Антон Адамсон on 23.04.2024.
//

import SwiftUI

struct ContentView: View {
    init() {
        // Настройка внешнего вида TabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor.black
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.blue1
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray

        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.blue1]
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]

        // Применяем настройки к UITabBar
        UITabBar.appearance().standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
    
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Поиск", systemImage: "magnifyingglass")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
