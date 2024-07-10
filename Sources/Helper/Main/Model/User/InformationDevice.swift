//
//  InformationDevice.swift
//  
//
//  Created by Danilo Hernandez.
//

import Foundation
import UIKit

struct InformationDevice {
    var email: String = ""
    var deviceUUID: String = ""
    
    mutating func returnInformation()  {
        guard  let deviceUUID = UIDevice.current.identifierForVendor?.uuidString else { return }
        self.deviceUUID = deviceUUID
        self.email = deviceUUID  + "@periferia-it.com"
    }
}
