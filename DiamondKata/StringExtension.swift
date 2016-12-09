//
//  StringExtension.swift
//  DiamondKata
//
//  Created by Tomás Ruiz López on 9/12/16.
//  Copyright © 2016 Tomás Ruiz-López. All rights reserved.
//

import Foundation

extension String {
    func reversed() -> String {
        return String(self.characters.reversed())
    }
    
    func character(at position: Int) -> Character {
        return Array(self.characters)[position]
    }
}
