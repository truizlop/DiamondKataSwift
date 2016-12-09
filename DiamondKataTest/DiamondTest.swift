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
            return diamond(character).count == 2 * character.ordinal()! + 1
        }
    }
    
    func testSquareness() {
        property("Each line of the diamond must have as many characters as lines the diamond has") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            let result = diamond(character)
            let lines = result.count
            return self.allTrue(result.map{ $0.length == lines })
        }
    }
    
    func testSingleLetterPerLine() {
        property("Each line should have a single letter in increasing order") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            let result = diamond(character)
            let topHalf = Array(result[0 ..< (result.count / 2 + 1)])
            return self.allTrue(topHalf.enumerated().map{ (index, line) in
                let lettersInLine = Set(line.characters.flatMap{ $0.ordinal() })
                let expectedLetters = Set([index])
                return lettersInLine == expectedLetters
            })
        }
    }
    
    func testSymmetry() {
        property("A diamond must be vertically symmetrical") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            let result = diamond(character)
            return result == result.reversed()
        }
        
        property("A diamond must be horizontally symmetrical") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            let result = diamond(character)
            let horizontalSymmetry = result.map{ $0.reversed() }
            return result == horizontalSymmetry
        }
    }
    
    func testEachLineHasOnlyOneLetterInFirstHalf() {
        property("Each line of the diamond must only have a letter in first half") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            let result = diamond(character)
            return self.allTrue(result.map{ (line : String) in
                (Array(line.characters)[0 ..< line.length/2 + 1]).flatMap{ $0 == Character(" ") ? nil : $0 }.count == 1
            })
        }
    }
    
    func testLetterIsPlacedCorrectlyInEachLine() {
        property("A letter in first half of line i must be placed in line.length / 2 - i") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            let result = diamond(character)
            let topHalf = Array(result[0 ..< (result.count / 2 + 1)])
            return self.allTrue(topHalf.enumerated().map{ (index, line) in
                line.character(at: line.length / 2 - index).ordinal() == index
            })
        }
    }
    
    func allTrue(_ array : [Bool]) -> Bool {
        return array.reduce(true){ $0 && $1 }
    }
}
