//
//  Day3SolutionsTests.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class Day3SolutionsTests: XCTestCase {
    func testA() {
        let solution = DayThreeA<[String]>()
        let input = [
            "00100",
            "11110",
            "10110",
            "10111",
            "10101",
            "01111",
            "00111",
            "11100",
            "10000",
            "11001",
            "00010",
            "01010"
        ]
        
        let result = solution.solve(input: input)
        
        XCTAssertEqual(198, result)
    }
    
    func testB() {
        let solution = DayThreeB<[String]>()
        let input = [
            "00100",
            "11110",
            "10110",
            "10111",
            "10101",
            "01111",
            "00111",
            "11100",
            "10000",
            "11001",
            "00010",
            "01010"
        ]
        
        let result = solution.solve(input: input)
        
        XCTAssertEqual(230, result)
    }
}
