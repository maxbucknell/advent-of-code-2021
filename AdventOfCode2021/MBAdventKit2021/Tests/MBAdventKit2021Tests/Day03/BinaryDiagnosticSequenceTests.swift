//
//  BinaryDiagnosticSequenceTests.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class BinaryDiagnosticSequenceTests: XCTestCase {
    func testSequencing() {
        let input = ["100", "010"]
        let sequence = BinaryDiagnosticSequence(input: input)
        
        let results = [[1, 0, 0], [0, 1, 0]]
        
        var count = 0
        for diagnosticCode in sequence {
            XCTAssertEqual(results[count], diagnosticCode)
            
            count += 1
        }
        
        XCTAssertEqual(2, count)
    }
    
    func testPopping() {
        let input = ["100", "000", "011", "110"]
        
        let sequence = BinaryDiagnosticSequence(input: input)
        var iterator = sequence.makeIterator()
        
        let expected = [2, 2, 1]
        
        guard let first = iterator.next() else {
            XCTAssertTrue(false)
            return
        }
        
        let actual = iterator.reduce(first) { acc, next in
            return zip(acc, next).map(+)
        }
        
        XCTAssertEqual(actual, expected)
    }
}
