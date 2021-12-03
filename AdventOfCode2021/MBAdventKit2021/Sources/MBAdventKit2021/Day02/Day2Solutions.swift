//
//  Day2Solutions.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

public struct DayTwoA<S: Sequence>: Solution where S.Element == String {
    public init() {
        
    }
    
    public func solve(input: S) -> Int {
        let instructions = InstructionSequence(input: input)
        let initialPosition = NaiveSubmarinePosition(position: 0, depth: 0)
        
        let finalPosition = instructions.reduce(initialPosition, { position, instruction in position.apply(instruction: instruction)})
        
        return finalPosition.position * finalPosition.depth
    }
}

public struct DayTwoB<S: Sequence>: Solution where S.Element == String {
    public init() {
        
    }
    
    public func solve(input: S) -> Int {
        let instructions = InstructionSequence(input: input)
        let initialPosition = RefinedSubmarinePosition(position: 0, aim: 0, depth: 0)
        
        let finalPosition = instructions.reduce(initialPosition, { position, instruction in position.apply(instruction: instruction)})
        
        return finalPosition.position * finalPosition.depth
    }
}
