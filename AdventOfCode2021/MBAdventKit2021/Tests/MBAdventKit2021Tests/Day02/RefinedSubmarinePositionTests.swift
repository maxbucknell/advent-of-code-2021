//
//  RefinedSubmarinePositionTests.swift
//
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class RefinedSubmarinePositionTests: XCTestCase {
    func testForward() {
        let initialPosition = RefinedSubmarinePosition(position: 10, aim: 2, depth: 8)
        let result = initialPosition.apply(instruction: .forward(10))
        
        XCTAssertEqual(20, result.position)
        XCTAssertEqual(2, result.aim)
        XCTAssertEqual(28, result.depth)
    }
    
    func testUp() {
        let initialPosition = RefinedSubmarinePosition(position: 10, aim: 2, depth: 8)
        let result = initialPosition.apply(instruction: .up(3))
        
        XCTAssertEqual(10, result.position)
        XCTAssertEqual(-1, result.aim)
        XCTAssertEqual(8, result.depth)
    }
    
    func testDown() {
        let initialPosition = RefinedSubmarinePosition(position: 10, aim: 2, depth: 8)
        let result = initialPosition.apply(instruction: .down(4))
        
        XCTAssertEqual(10, result.position)
        XCTAssertEqual(6, result.aim)
        XCTAssertEqual(8, result.depth)
    }
    
    func testComposite() {
        let initialPosition = RefinedSubmarinePosition(position: 10, aim: 2, depth: 8)
        let result = initialPosition.apply(instruction: .up(3)).apply(instruction: .forward(3)).apply(instruction: .down(7)).apply(instruction: .forward(10))
        
        XCTAssertEqual(23, result.position)
        XCTAssertEqual(6, result.aim)
        XCTAssertEqual(65, result.depth)
    }
}
