//
//  Day1SolutionsTests.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class Day1SolutionsTests: XCTestCase {
    func testA() {
        let solution = DayOneA<[String]>()
        let input = ["199", "200", "208", "210", "200", "207", "240", "269", "260", "263"]
        
        let result = solution.solve(input: input)
        
        XCTAssertEqual(7, result)
    }
    
    func testB() {
        let solution = DayOneB<[String]>()
        let input = ["199", "200", "208", "210", "200", "207", "240", "269", "260", "263"]
        
        let result = solution.solve(input: input)
        
        XCTAssertEqual(5, result)
    }
}
