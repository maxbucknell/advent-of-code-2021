//
//  Instruction.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

enum Instruction: Equatable {
    case forward(Int)
    case up(Int)
    case down(Int)
    
    init?(string: String) {
        let components = string.split(separator: " " as Character)
        
        if components.count != 2 {
            return nil
        }
        
        guard let value = Int(components[1]) else {
            return nil
        }
        
        switch String(components[0]) {
        case "forward":
            self = .forward(value)
        case "up":
            self = .up(value)
        case "down":
            self = .down(value)
        default:
            return nil
        }
    }
}
