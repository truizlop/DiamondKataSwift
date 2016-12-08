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
    
    func testProducesAnOddNumberOfLines() {
        property("Given a character, its diamond has an odd number of lines") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            return self.isOdd(diamond(character).count)
        }
    }
    
    func isOdd(_ n : Int) -> Bool {
        return n % 2 == 1
    }

}
