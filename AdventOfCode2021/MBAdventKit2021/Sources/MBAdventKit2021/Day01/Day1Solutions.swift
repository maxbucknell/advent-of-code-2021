//
//  Day1Solutions.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

public struct DayOneA<S: Sequence>: Solution where S.Element == String {
    public init() {
        
    }
    
    public func solve(input: S) -> Int {
        let depths = DepthSequence(input: input)
        let increases = IncreaseSequence(input: depths, pointCount: 1)
        
        return increases.map({ increase in increase ? 1 : 0 }).reduce(0, +)
    }
}

public struct DayOneB<S: Sequence>: Solution where S.Element == String {
    public init() {
        
    }
    
    public func solve(input: S) -> Int {
        let depths = DepthSequence(input: input)
        let increases = IncreaseSequence(input: depths, pointCount: 3)
        
        return increases.map({ increase in increase ? 1 : 0 }).reduce(0, +)
    }
}
