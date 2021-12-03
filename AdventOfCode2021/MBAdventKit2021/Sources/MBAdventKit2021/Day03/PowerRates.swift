//
//  File.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

func calculateMostCommonBitValuesInSequence<S: Sequence>(_ sequence: BinaryDiagnosticSequence<S>) -> [Int] where S.Element == String {
    var iterator = sequence.makeIterator()
    
    // Pop first element to use as start of reduction
    guard let first = iterator.next() else {
        return []
    }
    
    var count = 1
    
    let result = iterator.reduce(first) { acc, next in
        count += 1
        return zip(acc, next).map(+)
    }
    
    let boundary = Double(count) / 2.0
    
    return result.map { position in
        // Equally common is a 1, as specified in part 2
        return Double(position) >= boundary ? 1 : 0
    }
}

func calculateGammaRateFromMostCommonBits(_ bits: [Int]) -> Int {
    return bits.reduce(0) { total, nextDigit in
        return (total << 1) + nextDigit
    }
}

func calculateEpsilonRateFromMostCommonBits(_ bits: [Int]) -> Int {
    return bits.reduce(0) { total, nextDigit in
        return (total << 1) + (nextDigit ^ 1)
    }
}
