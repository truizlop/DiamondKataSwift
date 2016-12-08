//
//  DiamondTest.swift
//  DiamondKata
//
//  Created by Tomás Ruiz López on 8/12/16.
//  Copyright © 2016 Tomás Ruiz-López. All rights reserved.
//

import XCTest
import SwiftCheck
@testable import DiamondKata

class DiamondTest: XCTestCase {

    let uppercaseCharacterGen = Gen<Character>.fromElementsIn(Character("A")...Character("Z"))
    
    func testNumberOfLines() {
        property("Given a character, its diamond has 2 * ordinal(character) + 1 lines") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            return diamond(character).count == 2 * character.ordinal() + 1
        }
    }
    
    func testSquareness() {
        property("Each line of the diamond must have as many characters as lines the diamond has") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            let result = diamond(character)
            let lines = result.count
            return result.map{ $0.characters.count == lines }.reduce(true){ $0 && $1}
        }
    }
    
    func testSingleLetterPerLine() {
        property("Each line should have a single letter in increasing order") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            let result = diamond(character)
            let topHalf = Array(result[0 ..< (result.count / 2 + 1)])
            return topHalf.enumerated().map{ (index, line) in
                let lettersInLine = Set(line.characters.map{ $0.ordinal() })
                let expectedLetters = Set([index])
                return lettersInLine == expectedLetters
                }.reduce(true){ $0 && $1 }
        }
    }
}
