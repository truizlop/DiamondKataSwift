//
//  StringExtension.swift
//  DiamondKata
//
//  Created by Tomás Ruiz López on 9/12/16.
//  Copyright © 2016 Tomás Ruiz-López. All rights reserved.
//

import Foundation

extension String {
    var length : Int {
        return self.characters.count
    }
    
    func reversed() -> String {
        return String(self.characters.reversed())
    }
    
    func character(at position: Int) -> Character {
        return Array(self.characters)[position]
    }
    
    func firstHalf() -> String {
        let index = self.index(self.startIndex, offsetBy: length / 2 + 1)
        return self.substring(to: index)
    }
    
    func removeBlanks() -> String {
        return String(self.characters.flatMap{ $0 == Character(" ") ? nil : $0 })
    }
}
