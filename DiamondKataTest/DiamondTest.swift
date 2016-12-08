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
    
}
