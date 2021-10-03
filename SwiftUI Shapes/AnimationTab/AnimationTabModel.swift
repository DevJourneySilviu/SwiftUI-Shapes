//
//  AnimationTabModel.swift
//  SwiftUI Shapes
//
//  Created by Silviu Nicolae on 03.10.2021.
//

import SwiftUI


struct CardForHorizontalScrollingAnimation: Identifiable {
    
    var id    = UUID()
    var title : String
    var image : String
    var color : Color
}

let cardDataForHorizontalScrollingAnimation = [
    CardForHorizontalScrollingAnimation(title: "Stationary Bike with VR technology",
         image: "card_Hscroll_illustration_1",
         color: Color("FFF7EC")),
    CardForHorizontalScrollingAnimation(title: "Treadmill with VR technology",
         image: "card_Hscroll_illustration_2",
         color: Color("A9E2F5")),
    CardForHorizontalScrollingAnimation(title: "Indoor yoga",
         image: "card_Hscroll_illustration_3",
         color: Color("FBC7C3")),
    CardForHorizontalScrollingAnimation(title: "Exercise with weights",
         image: "card_Hscroll_illustration_4",
         color: Color("38B3D0")),
]
