//
//  CharacterExtension.swift
//  DiamondKata
//
//  Created by Tomás Ruiz López on 8/12/16.
//  Copyright © 2016 Tomás Ruiz-López. All rights reserved.
//

import Foundation

extension Character {
    init(fromOrdinal n: Int) {
        self.init(UnicodeScalar(UnicodeScalar("A")!.value + UInt32(n))!)
    }
    
    func unicodeScalarCodePoint() -> UInt32 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        return scalars[scalars.startIndex].value
    }
    
    func ordinal() -> Int? {
        return (Character("A") ... Character("Z")).contains(self) ? Int(self.unicodeScalarCodePoint() - Character("A").unicodeScalarCodePoint()) : nil
    }
}

func *(lhs : Character, rhs : Int) -> String {
    return (0 ..< rhs).map{ _ in String(lhs) }.reduce(""){ "\($0)\($1)" }
}
