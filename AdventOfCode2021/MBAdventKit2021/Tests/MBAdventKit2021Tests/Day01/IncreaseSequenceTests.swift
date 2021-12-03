//
//  IncreaseSequenceTests.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class IncreaseSequenceTests: XCTestCase {
    func testWithSinglePointCount() {
        let sequence = IncreaseSequence(input: [1, 2], pointCount: 1)
        
        var count = 0
        
        for isIncrease in sequence {
            count += 1
            
            XCTAssertTrue(isIncrease)
        }
        
        XCTAssertEqual(1, count)
    }
    
    func testMoreWithSinglePointCount() {
        let sequence = IncreaseSequence(input: [1, 9, 5, 7], pointCount: 1)
        
        let results = [true, false, true]
        var count = 0
        
        for isIncrease in sequence {
            XCTAssertEqual(results[count], isIncrease)
            
            count += 1
        }
        
        XCTAssertEqual(3, count)
    }
    
    func testWithDoublePointCount() {
        let sequence = IncreaseSequence(input: [1, 9, 5, 7, 8, 12, 2], pointCount: 2)
        
        let results = [true, false, true, true, false]
        var count = 0
        
        for isIncrease in sequence {
            XCTAssertEqual(results[count], isIncrease)
            
            count += 1
        }
        
        XCTAssertEqual(5, count)
    }
}
