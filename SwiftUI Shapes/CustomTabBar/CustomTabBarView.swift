//
//  CustomTabBarView.swift
//  SwiftUI Shapes
//
//  Created by Silviu Nicolae on 25.09.2021.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @State var currentTab: Tab = .Home
    
    // Hide native Tab Bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    // Matched Geometry Effect
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $currentTab) {
            Text("Home View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red.ignoresSafeArea())
                .tag(Tab.Home)
            
            Text("Search View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue.ignoresSafeArea())
                .tag(Tab.Search)
            
            Text("Notifications View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green.ignoresSafeArea())
                .tag(Tab.Notifications)
            
            Text("Profile View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.yellow.ignoresSafeArea())
                .tag(Tab.Profile)
        }.overlay(
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 5))
                .background(
                    MaterialEffect(style: .systemThinMaterial)
                )
            },
            alignment: .bottom
        ).ignoresSafeArea(.all, edges: .bottom)
    }
    
    // Tab Button
    @ViewBuilder
    func TabButton(tab: Tab) -> some View {
        
        GeometryReader { proxy in
            
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            }) {
                VStack(spacing: 2) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(currentTab == tab ? .primary : .secondary)
                        .padding(currentTab == tab ? 15 : 0)
                        .background(
                            ZStack {
                                if currentTab == tab {
                                    MaterialEffect(style: .systemMaterial)
                                        .clipShape(Circle())
                                        .matchedGeometryEffect(id: "TAB", in: animation)
                                }
                            })
                        .contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -25 : 0)
                    
                    if currentTab != tab {
                        Text(tab.tabName)
                            .foregroundColor(.secondary)
                            .font(.footnote)
                    }
                }
            }
        }.frame(height: 25)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}


// Tab Bar enums
enum Tab: String, CaseIterable {
    
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notifications = "bell"
    case Profile = "person"
    
    var tabName: String {
        switch self {
        case .Home:
            return "Home"
        case .Search:
            return "Search"
        case .Notifications:
            return "Notifications"
        case .Profile:
            return "Profile"
        }
    }
}

// Safe Area
extension View {
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}
