//
//  CurrentUserData.swift
//
//
//  Created by Danilo Hernandez.
//

import Foundation

public struct CurrentUserData {
    
    var id: String
    var email: String
    var name: String
    
    public init(id: String, email: String, name: String) {
        self.id = id
        self.email = email
        self.name = name
    }
}
