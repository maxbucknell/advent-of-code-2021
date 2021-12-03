//
//  DepthSequenceTests.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class DepthSequenceTests: XCTestCase {
    func testWithSingleInput() {
        let sequence = DepthSequence(input: ["1"])
        
        var count = 0
        
        for depth in sequence {
            count += 1
            
            XCTAssertEqual(1, depth)
        }
        
        XCTAssertEqual(1, count)
    }
    
    func testWithMultipleInputs() {
        let sequence = DepthSequence(input: ["12", "1400", "314159"])
        let values = [12, 1400, 314159]
        
        var count = 0
        
        for depth in sequence {
            XCTAssertEqual(values[count], depth)
            
            count += 1
        }
        
        XCTAssertEqual(3, count)
    }
}
