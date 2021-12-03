//
//  SubmarinePosition.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

protocol SubmarinePosition {
    func apply(instruction: Instruction) -> Self
}
