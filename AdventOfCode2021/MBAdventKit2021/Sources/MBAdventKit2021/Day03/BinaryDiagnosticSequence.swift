//
//  File.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

struct BinaryDiagnosticSequence<S: Sequence>: Sequence, IteratorProtocol where S.Element == String {
    
    var input: S.Iterator
    var length: Int?

    init(input: S) {
        self.input = input.makeIterator()
    }
    
    mutating func next() -> [Int]? {
        guard let next = input.next() else {
            return nil
        }
        
        if length == nil {
            length = next.count
        } else if next.count != length {
            return nil
        }
        
        return Array(next).map { c in
            return c == "1" ? 0x01 : 0x00
        }
    }
}
