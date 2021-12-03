//
//  RefinedSubmarinePosition.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

struct RefinedSubmarinePosition: SubmarinePosition {
    let position: Int
    let aim: Int
    let depth: Int
    
    init(position: Int, aim: Int, depth: Int) {
        self.position = position
        self.aim = aim
        self.depth = depth
    }
    
    func apply(instruction: Instruction) -> RefinedSubmarinePosition {
        switch instruction {
        case .forward(let forward):
            return RefinedSubmarinePosition(position: position + forward, aim: aim, depth: depth + (aim * forward))
        case .up(let up):
            return RefinedSubmarinePosition(position: position, aim: aim - up, depth: depth)
        case .down(let down):
            return RefinedSubmarinePosition(position: position, aim: aim + down, depth: depth)
        }
    }
}
