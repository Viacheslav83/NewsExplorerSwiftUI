//
//  TabBarView.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    
    private let tabItems = Tab.allCases
    
    var body: some View {
        TabView {
            ForEach(tabItems, id: \.self) { tab in
                switch tab {
                case .news:
                    NewsView()
                        .tabItem { 
                            createTabView(tab: tab)
                        }
                        .tag(tab)
                case .profile:
                    ProfileView()
                        .tabItem {
                            createTabView(tab: tab)
                        }
                        .tag(tab)
                }
            }
            
        }
    }
}

#Preview {
    TabBarView()
}

extension TabBarView {
    func createTabView(tab: Tab) -> some View {
        return VStack {
            Image(systemName: tab.imageName)
                .resizable()
                .aspectRatio(CGSize(width: 20, height: 20), contentMode: .fit)
            Text(tab.title)
                .font(.footnote)
                .fontWeight(.regular)
        }
    }
}
