//
//  AnimationTabView.swift
//  SwiftUI Shapes
//
//  Created by Silviu Nicolae on 03.10.2021.
//

import SwiftUI

let animationTabList = [
    AppTabList(name: "Card Horizontal Scrolling", view: AnyView(CardHorizontalScrolling())),
]

struct AnimationTabView: View {
    var body: some View {
        List {
            ForEach(animationTabList) { item in
                NavigationLink(destination: item.view) {
                    Text(item.name)
                }
            }
        }
        .navigationTitle("Animations")
    }
}

struct AnimationTabView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTabView()
    }
}
