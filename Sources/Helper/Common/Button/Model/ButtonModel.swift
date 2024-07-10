//
//  ButtonModel.swift
//
//
//  Created by Danilo Hernandez.
//

import SwiftUI

public struct ButtonModel {
    

    public let designButton: ComponentDesign
    public let image: Image?
    public let title: TextViewModel
    
    
    public init(image: Image? = nil, designButton: ComponentDesign, title: TextViewModel) {
        self.title = title
        self.image = image
        self.designButton = designButton
    }
}

