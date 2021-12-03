//
//  IncreaseSequence.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

struct IncreaseSequence<S: Sequence, T: Numeric & Strideable>: Sequence, IteratorProtocol where S.Element == T {
    
    var input: S.Iterator
    let pointCount: Int
    var retained: [T] = []

    init(input: S, pointCount: Int) {
        self.input = input.makeIterator()
        self.pointCount = pointCount
        
        for i in 0..<pointCount {
            guard let x = self.input.next() else {
                fatalError("Expected at least \(self.pointCount) inputs in sequence, but found \(i).")
            }
            
            retained.append(x)
        }
    }
    
    mutating func next() -> Bool? {
        guard let x = input.next() else {
            return nil
        }
        
        let newRetained = Array(retained.suffix(pointCount - 1)) + [x]
        
        let currentSum = retained.reduce(0, +)
        let newSum = newRetained.reduce(0, +)
        
        retained = newRetained
        
        return newSum > currentSum
    }
}
