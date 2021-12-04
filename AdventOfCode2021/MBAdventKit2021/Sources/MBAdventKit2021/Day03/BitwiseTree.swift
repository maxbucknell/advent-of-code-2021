//
//  BitwiseTree.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

struct BitwiseTree {
    let value: Int
    var nodes: Dictionary<Int, BitwiseTree> = [:]
    
    var weight: Int = 0
    
    init(value: Int) {
        self.value = value
    }
    
    init(byMergingTrees trees: [BitwiseTree], andValue value: Int) {
        self.value = value
        
        let treesWithWeight = trees.filter { tree in tree.weight > 0 }
        
        if treesWithWeight.count == 0 {
            return
        }

        self.weight = treesWithWeight.map({ tree in tree.weight }).reduce(0, +)
        
        let zeros = treesWithWeight.map { tree in tree[0x00] ?? BitwiseTree(value: 0x00) }
        let ones = treesWithWeight.map { tree in tree[0x01] ?? BitwiseTree(value: 0x01) }
        
        self.nodes[0] = BitwiseTree(byMergingTrees: zeros, andValue: 0x00)
        self.nodes[1] = BitwiseTree(byMergingTrees: ones, andValue: 0x01)
    }
    
    var heaviest: BitwiseTree? {
        let zero = nodes[0x00]
        let one = nodes[0x01]
        
        if zero == nil {
            return one
        } else if one == nil {
            return zero
        } else if one!.weight >= zero!.weight {
            return one
        } else {
            return zero
        }
    }
    
    var heaviestPath: [Int] {
        if heaviest == nil {
            return []
        }
        
        return [heaviest!.value] + heaviest!.heaviestPath
    }
    
    var lightest: BitwiseTree? {
        let zero = nodes[0x00]
        let one = nodes[0x01]
        
        if zero == nil {
            return one
        } else if one == nil {
            return zero
        } else if zero!.weight <= one!.weight {
            return zero
        } else {
            return one
        }
    }
    
    var lightestPath: [Int] {
        if lightest == nil {
            return []
        }
        
        return [lightest!.value] + lightest!.lightestPath
    }
    
    var isLeaf: Bool {
        let zeroWeight = nodes[0]?.weight ?? 0
        let oneWeight = nodes[1]?.weight ?? 0
        
        return (zeroWeight + oneWeight) == 0
    }
    
    var mostCommonBits: [Int] {
        if isLeaf {
            return []
        }
        
        let left = nodes[0] ?? BitwiseTree(value: 0x00)
        let right = nodes[1] ?? BitwiseTree(value: 0x01)
        
        return [heaviest!.value] + (left + right).mostCommonBits
    }
    
    subscript(value: Int) -> BitwiseTree? {
        switch value {
        case 0x00:
            return nodes[value]
        case 0x01:
            return nodes[value]
        default:
            return nil
        }
    }
    
    mutating func addElement(_ element: [Int]) {
        weight += 1
        
        if (element.count == 0) {
            return
        }
        
        let index = element[0]
        let rest = Array(element.dropFirst())
        
        if nodes[index] == nil {
            nodes[index] = BitwiseTree(value: index)
        }
        
        nodes[index]!.addElement(rest)
    }
    
    static func + (left: BitwiseTree, right: BitwiseTree) -> BitwiseTree {
        return BitwiseTree(byMergingTrees: [left, right], andValue: 0x00)
    }
}

