//
//  CharacterExtension.swift
//  DiamondKata
//
//  Created by Tomás Ruiz López on 8/12/16.
//  Copyright © 2016 Tomás Ruiz-López. All rights reserved.
//

import Foundation

extension Character {
    func unicodeScalarCodePoint() -> UInt32 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        return scalars[scalars.startIndex].value
    }
    
    func ordinal() -> Int {
        return Int(self.unicodeScalarCodePoint() - Character("A").unicodeScalarCodePoint())
    }
}
