//
//  Day3Solutions.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

public struct DayThreeA<S: Sequence>: Solution where S.Element == String {
    public init() {
        
    }
    
    public func solve(input: S) -> Int {
        let binaryDiagnosticSequence = BinaryDiagnosticSequence(input: input)
        
        let mostCommonBits = calculateMostCommonBitValuesInSequence(binaryDiagnosticSequence)
        let gammaRate = calculateGammaRateFromMostCommonBits(mostCommonBits)
        let epsilonRate = calculateEpsilonRateFromMostCommonBits(mostCommonBits)
        
        return gammaRate * epsilonRate
    }
}

public struct DayThreeB<S: Sequence>: Solution where S.Element == String {
    public init() {
        
    }
    
    public func solve(input: S) -> Int {
        let sequence = BinaryDiagnosticSequence(input: input)
        var tree = BitwiseTree(value: 0x00)
        
        for code in sequence {
            tree.addElement(code)
        }
        
        let oxygenGeneratorRating = tree.heaviestPath.reduce(0x00) { total, digit in
            return (total << 1) + digit
        }
        
        let cO2ScrubberRating = tree.lightestPath.reduce(0x00) { total, digit in
            return (total << 1) + digit
        }
        
        return oxygenGeneratorRating * cO2ScrubberRating
    }
}
