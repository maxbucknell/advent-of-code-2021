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
}
