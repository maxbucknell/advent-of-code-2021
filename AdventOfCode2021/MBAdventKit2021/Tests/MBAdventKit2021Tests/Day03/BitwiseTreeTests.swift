//
//  BitwiseTreeTests.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import XCTest
@testable import MBAdventKit2021

final class BitwiseTreeTests: XCTestCase {
    func testCreation() {
        let tree = BitwiseTree(value: 0x00)
        
        XCTAssertEqual(0, tree.weight)
    }
    
    func testAddingElement() {
        var tree = BitwiseTree(value: 0x00)
        
        tree.addElement([0, 1, 0])
        
        XCTAssertEqual(1, tree.weight)
        XCTAssertEqual(1, tree[0]?.weight)
        XCTAssertEqual(1, tree[0]?[1]?[0]?.weight)
    }
    
    func testHeaviestAndLightest() {
        var tree = BitwiseTree(value: 0x00)
        
        tree.addElement([0, 1])
        tree.addElement([0, 0])
        tree.addElement([1, 1])
        
        XCTAssertEqual(0, tree.heaviest?.value)
        XCTAssertEqual(1, tree.lightest?.value)
        XCTAssertEqual(1, tree.heaviest?.heaviest?.value)
        XCTAssertEqual(0, tree.heaviest?.lightest?.value)
    }
    
    func testWeights() {
        var tree = BitwiseTree(value: 0x00)
        
        tree.addElement([0, 1])
        tree.addElement([0, 0])
        tree.addElement([1, 1])
        
        XCTAssertEqual(3, tree.weight)
        XCTAssertEqual(2, tree[0]?.weight)
        XCTAssertEqual(1, tree[1]?[1]?.weight)
    }
    
    func testHeaviestPath() {
        var tree = BitwiseTree(value: 0x00)
        
        tree.addElement([0, 1])
        tree.addElement([0, 0])
        tree.addElement([1, 1])
        
        XCTAssertEqual([0, 1], tree.heaviestPath)
    }
    
    func testLightestPath() {
        var tree = BitwiseTree(value: 0x00)
        
        tree.addElement([0, 1])
        tree.addElement([0, 0])
        tree.addElement([0, 1])
        tree.addElement([0, 1])
        tree.addElement([1, 1])
        tree.addElement([1, 1])
        tree.addElement([1, 0])
        
        XCTAssertEqual([1, 0], tree.lightestPath)
    }
    
    func testSoloPath() {
        var tree = BitwiseTree(value: 0x00)
        
        tree.addElement([0, 1, 1, 1, 0, 0, 1, 0, 0, 1])
        
        XCTAssertEqual([0, 1, 1, 1, 0, 0, 1, 0, 0, 1], tree.lightestPath)
        XCTAssertEqual([0, 1, 1, 1, 0, 0, 1, 0, 0, 1], tree.heaviestPath)
        
    }
}
