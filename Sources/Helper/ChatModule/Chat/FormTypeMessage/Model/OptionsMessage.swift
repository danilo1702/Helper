//
//  OptionsMessage.swift
//
//
//  Created by Danilo Hernandez.
//

import Foundation
import Drawing

public struct OptionsMessage {
    public var id: String
    public var text: String?
    public var position: Int?
    public var lines: [LineModel]?
    public init(id: String, text: String? = nil, position: Int? = nil, lines: [LineModel]? = nil) {
        self.id = id
        self.text = text
        self.position = position
        self.lines = lines
    }
}
