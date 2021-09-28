//
//  DesignTabView.swift
//  SwiftUI Shapes
//
//  Created by Silviu Nicolae on 28.09.2021.
//

import SwiftUI

var designTabList = [
    DesignTabList(name: "Glassmorphism", view: AnyView(GlassmorphismView())),
]

struct DesignTabView: View {
    var body: some View {
        List {
            ForEach(designTabList) { item in
                NavigationLink(destination: item.view) {
                    Text(item.name)
                }
            }
        }
        .navigationTitle("Design Ideas")
    }
}

struct DesignTabView_Previews: PreviewProvider {
    static var previews: some View {
        DesignTabView()
    }
}
