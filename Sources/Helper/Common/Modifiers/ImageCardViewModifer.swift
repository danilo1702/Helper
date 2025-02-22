//
//  ImageCardViewModifer.swift
//
//
//  Created by Danilo Hernandez.
//

import SwiftUI


struct ImageCardViewModifer: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width * 0.2)
            .clipShape(Circle())
    }
}

