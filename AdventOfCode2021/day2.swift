//
//  day2.swift
//  AdventOfCode2021
//
//  Created by Max Bucknell on 2/12/21.
//

import Foundation

protocol SubmarinePosition {
    func apply(instruction: Instruction) -> Self
}

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

enum Instruction {
    case forward(Int)
    case up(Int)
    case down(Int)
    
    static func fromString(_ s: String) -> Self? {
        let components = s.split(separator: " " as Character)
        guard let value = Int(components[1]) else {
            return nil
        }
        
        switch String(components[0]) {
        case "forward":
            return .forward(value)
        case "up":
            return .up(value)
        case "down":
            return .down(value)
        default:
            return nil
        }
    }
}

struct InstructionSequence: Sequence {
    func makeIterator() -> InstructionIterator {
        return InstructionIterator()
    }
}

struct InstructionIterator: IteratorProtocol {
    typealias Element = Instruction
    
    func next() -> Element? {
        guard let input = readLine(strippingNewline: true) else {
            return nil
        }
        
        return Instruction.fromString(input)
    }
}

func firstOfSecond() -> Int {
    let instructions = InstructionSequence()
    let initialPosition = NaiveSubmarinePosition(position: 0, depth: 0)
    
    let finalPosition = instructions.reduce(initialPosition, { position, instruction in position.apply(instruction: instruction)})

    return finalPosition.position * finalPosition.depth
}

func secondOfSecond() -> Int {
    let instructions = InstructionSequence()
    let initialPosition = RefinedSubmarinePosition(position: 0, aim: 0, depth: 0)
    
    let finalPosition = instructions.reduce(initialPosition, { position, instruction in position.apply(instruction: instruction)})

    return finalPosition.position * finalPosition.depth
}
