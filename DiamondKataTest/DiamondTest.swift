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
    
    func testProducesSomeLines() {
        property("Given a character, it produces some lines") <- forAll(self.uppercaseCharacterGen) { (character : Character) in
            return !diamond(character).isEmpty
        }
    }

}
