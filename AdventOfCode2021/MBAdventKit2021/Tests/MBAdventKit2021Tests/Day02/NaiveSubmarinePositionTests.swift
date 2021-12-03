//
//  NaiveSubmarinePositionTests.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class NaiveSubmarinePositionTests: XCTestCase {
    func testForward() {
        let initialPosition = NaiveSubmarinePosition(position: 4, depth: 8)
        let result = initialPosition.apply(instruction: .forward(10))
        
        XCTAssertEqual(14, result.position)
        XCTAssertEqual(8, result.depth)
    }
    
    func testUp() {
        let initialPosition = NaiveSubmarinePosition(position: 4, depth: 8)
        let result = initialPosition.apply(instruction: .up(3))
        
        XCTAssertEqual(4, result.position)
        XCTAssertEqual(5, result.depth)
    }
    
    func testDown() {
        let initialPosition = NaiveSubmarinePosition(position: 4, depth: 8)
        let result = initialPosition.apply(instruction: .down(21))
        
        XCTAssertEqual(4, result.position)
        XCTAssertEqual(29, result.depth)
    }
    
    func testComposite() {
        let initialPosition = NaiveSubmarinePosition(position: 4, depth: 8)
        let result = initialPosition.apply(instruction: .forward(10)).apply(instruction: .up(3)).apply(instruction: .down(21))
        
        XCTAssertEqual(14, result.position)
        XCTAssertEqual(26, result.depth)
    }
}
