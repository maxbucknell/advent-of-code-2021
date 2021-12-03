//
//  InstructionTests.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class InstructionTests: XCTestCase {
    func testValid() {
        XCTAssertEqual(Instruction(string: "forward 5"), .forward(5))
        XCTAssertEqual(Instruction(string: "up 217"), .up(217))
        XCTAssertEqual(Instruction(string: "down 91"), .down(91))
    }
    
    func testInvalid() {
        XCTAssertNil(Instruction(string: "NUTAUTAua"))
        XCTAssertNil(Instruction(string: "forward"))
        XCTAssertNil(Instruction(string: "back 9"))
        XCTAssertNil(Instruction(string: "up down"))
    }
}
