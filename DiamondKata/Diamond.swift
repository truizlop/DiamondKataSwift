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
    return [String(character)]
}
