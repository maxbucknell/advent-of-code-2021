//
//  InstructionSequence.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

struct InstructionSequence<S: Sequence>: Sequence, IteratorProtocol where S.Element == String {
    
    var input: S.Iterator
    
    init(input: S) {
        self.input = input.makeIterator()
    }
    
    mutating func next() -> Instruction? {
        guard let next = input.next() else {
            return nil
        }
        
        return Instruction(string: next)
    }
}
