//
//  CardModel.swift
//  
//
//  Created by Danilo Hernandez.
//

import Foundation
import SwiftUI

public struct CardModel: Identifiable {
    
    public var id: String
    public var image: ImageModel?
    public var link: String?
    public var uniqueId: UUID = UUID()
    public var titleFormat: TextViewModel
    public var dateFormat: TextViewModel?
    public var nameFormat: TextViewModel?
    public var designCard: ComponentDesign
    public var action: String
    public var fromUUID: String?
    public var toUUID: String?
    public var indicator: Bool?
    public var type: String
    
    
    public init(id: String, image: ImageModel? = nil, link: String? = nil, titleFormat: TextViewModel, dateFormat: TextViewModel? = nil, nameFormat: TextViewModel? = nil, designCard: ComponentDesign = ComponentDesign(backgroundColor: .gray.opacity(0.1), cornerRaiuds: 15.0), fromUUID: String? = nil, toUUID: String? = nil, indicator: Bool? = false, action: String = "", type: String = "text" ) {
        self.id = id
        self.image = image
        self.link = link
        self.titleFormat = titleFormat
        self.dateFormat = dateFormat
        self.nameFormat = nameFormat
        self.designCard = designCard
        self.fromUUID = fromUUID
        self.toUUID = toUUID
        self.indicator = indicator
        self.action = action
        self.type = type
    }
    
    public var imageUrl: URL?  {
        guard let image = image, let url = URL(string: image.image) else { return nil}
        return url
    }
}

public struct ImageModel {
    public let image: String
    public let backgroundColor: Color?
    
    public init(image: String, backgroundColor: Color? = nil) {
        self.image = image
        self.backgroundColor = backgroundColor
    }
}

public struct ComponentDesign {
    
    public var backgroundColor: Color
    public var cornerRaiuds: CGFloat
    public var colorSelected: Color
    
    public init(backgroundColor: Color, cornerRaiuds: CGFloat, colorSelected: Color? = nil) {
        self.backgroundColor = backgroundColor
        self.cornerRaiuds = cornerRaiuds
        self.colorSelected = colorSelected ?? backgroundColor
    }
}



