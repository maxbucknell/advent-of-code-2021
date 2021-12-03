//
//  Solution.swift
//  
//
//  Created by Max Bucknell on 3/12/21.
//

import Foundation

public protocol Solution {
    associatedtype S: Sequence where S.Element == String
    
    func solve(input: S) -> Int
}
