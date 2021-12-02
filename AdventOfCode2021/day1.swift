//
//  1a.swift
//  AdventOfCode2021
//
//  Created by Max Bucknell on 2/12/21.
//

import Foundation

struct DepthSequence: Sequence {
    func makeIterator() -> DepthIterator {
        return DepthIterator()
    }
}

struct DepthIterator: IteratorProtocol {
    typealias Element = UInt64
    
    func next() -> Element? {
        guard let input = readLine(strippingNewline: true) else {
            return nil
        }
        
        return UInt64(input)
    }
}

struct IncreaseSequence: Sequence {
    private let pointCount: Int
    
    init(pointCount: Int) {
        self.pointCount = pointCount
    }
    
    func makeIterator() -> IncreaseIterator {
        return IncreaseIterator(pointCount: self.pointCount)
    }
}

struct IncreaseIterator: IteratorProtocol {
    typealias Element = Bool
    
    private let pointCount: Int
    private let depthIterator = DepthIterator()
    private var depths: [UInt64] = []
    
    init(pointCount: Int) {
        self.pointCount = pointCount
        
        for i in 0..<self.pointCount {
            guard let depth = depthIterator.next() else {
                fatalError("Expected at least \(self.pointCount) inputs in depth list, but found \(i).")
            }
            
            depths.append(depth)
        }
    }
    
    mutating func next() -> Element? {
        guard let depth = depthIterator.next() else {
            return nil
        }
        
        let newDepths = Array(depths.suffix(self.pointCount - 1)) + [depth]
        
        let currentSum = self.sum(self.depths)
        let newSum = self.sum(newDepths)
        
        self.depths = newDepths
        
        return newSum > currentSum
    }
    
    private func sum(_ input: [UInt64]) -> UInt64 {
        return input.reduce(0, +)
    }
}

func firstOfFirst () -> UInt64 {
    let pointCount = 1
    let increases = IncreaseSequence(pointCount: pointCount)
    
    return increases.map({ increase in increase ? 1 : 0 }).reduce(0, +)
}

func secondOfFirst () -> UInt64 {
    let pointCount = 3
    let increases = IncreaseSequence(pointCount: pointCount)
    
    return increases.map({ increase in increase ? 1 : 0 }).reduce(0, +)
}
