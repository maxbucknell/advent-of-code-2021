//
//  Day2SolutionsTests.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class Day2SolutionsTests: XCTestCase {
    func testA() {
        let solution = DayTwoA<[String]>()
        let input = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]
        
        let result = solution.solve(input: input)
        
        XCTAssertEqual(result, 150)
    }
    
    func testB() {
        let solution = DayTwoB<[String]>()
        let input = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]
        
        let result = solution.solve(input: input)
        
        XCTAssertEqual(result, 900)
    }
}
