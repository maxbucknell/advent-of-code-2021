//
//  InputReader.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

public struct InputReader: Sequence, IteratorProtocol {
    public init() {
        
    }
    
    public func next() -> String? {
        return readLine(strippingNewline: true)
    }
}
