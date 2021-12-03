//
//  InstructionSequenceTests.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class InstructionSequenceTests: XCTestCase {
    func testSingleValue() {
        let sequence = InstructionSequence(input: ["up 5"])
        var count = 0
        
        for instruction in sequence {
            XCTAssertEqual(instruction, .up(5))
            count += 1
        }
        
        XCTAssertEqual(1, count)
    }
    
    func testWithMultipleInputs() {
        let sequence = InstructionSequence(input: ["down 12", "forward 18", "down 3", "up 7"])
        let values: [Instruction] = [.down(12), .forward(18), .down(3), .up(7)]
        
        var count = 0
        
        for instruction in sequence {
            XCTAssertEqual(values[count], instruction)
            
            count += 1
        }
        
        XCTAssertEqual(4, count)
    }
}
