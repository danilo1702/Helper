//
//  FirebaseManager.swift
//
//
//  Created by Danilo Hernandez.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseRemoteConfig
import FirebaseRemoteConfigInternal

public class FirebaseManagerData {
    
     var dbAuth: Auth
     var dbFirestore: Firestore
     var dbRemoteConfig: RemoteConfig
     var currentUser: CurrentUserData?
    
    static let initialization = FirebaseManagerData()
    
     public init() {
    
        self.dbAuth = Auth.auth()
        self.dbFirestore = Firestore.firestore()
        self.dbRemoteConfig = RemoteConfig.remoteConfig()
    }
}


