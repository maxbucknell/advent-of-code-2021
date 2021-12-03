//
//  NaiveSubmarinePosition.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

struct NaiveSubmarinePosition: SubmarinePosition {
    let position: Int
    let depth: Int
    
    init(position: Int, depth: Int) {
        self.position = position
        self.depth = depth
    }
    
    func apply(instruction: Instruction) -> NaiveSubmarinePosition {
        switch instruction {
        case .forward(let forward):
            return NaiveSubmarinePosition(position: position + forward, depth: depth)
        case .up(let up):
            return NaiveSubmarinePosition(position: position, depth: depth - up)
        case .down(let down):
            return NaiveSubmarinePosition(position: position, depth: depth + down)
        }
    }
}
