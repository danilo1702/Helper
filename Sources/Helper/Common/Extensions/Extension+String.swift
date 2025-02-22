//
//  Extension+String.swift
//
//
//  Created by Danilo Hernandez.
//

import Foundation

extension String {
    func parseToCGFloat() -> CGFloat {
        if let number = NumberFormatter().number(from: self) {
            let numberCgFloat = CGFloat(truncating: number)
            return numberCgFloat
        } else {
            return 0
        }
    }
}

