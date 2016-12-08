//
//  Diamond.swift
//  DiamondKata
//
//  Created by Tomás Ruiz López on 8/12/16.
//  Copyright © 2016 Tomás Ruiz-López. All rights reserved.
//

import Foundation

func printDiamond(character : Character) {
    diamond(character).forEach{ line in print(line) }
}

func diamond(_ character : Character) -> [String] {
    let topHalf = (0 ... character.ordinal()).map{ ordinal in
        Character(fromOrdinal: ordinal) * squareSide(character)
    }
    let bottomHalf = Array(topHalf[0 ..< topHalf.count - 1]).reversed()
    return topHalf + bottomHalf
}

func squareSide(_ character : Character) -> Int {
    return 2 * character.ordinal() + 1
}
