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
    let topHalf = (0 ... character.ordinal()!).map{ ordinal in
        makeLineForCharacter(withOrdinal: ordinal, withLength: squareSide(character))
    }
    let bottomHalf = Array(topHalf[0 ..< topHalf.count - 1]).reversed()
    return topHalf + bottomHalf
}

func squareSide(_ character : Character) -> Int {
    return 2 * character.ordinal()! + 1
}

func makeLineForCharacter(withOrdinal ordinal : Int, withLength length : Int) -> String {
    let firstSpaces = Character(" ") * (length / 2 - ordinal)
    let secondSpaces = Character(" ") * ordinal
    let leftHalf = firstSpaces + String(Character(fromOrdinal: ordinal)) + secondSpaces
    let rightHalf = (leftHalf.characters.count - 1 > 0) ? String(Array(leftHalf.characters)[0 ..< (leftHalf.characters.count - 1)]) : ""
    return leftHalf + String(rightHalf.characters.reversed())
}
