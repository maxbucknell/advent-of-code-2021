//
//  main.swift
//  AdventOfCode2021
//
//  Created by Max Bucknell on 2/12/21.
//

import Foundation

if (CommandLine.argc != 3) {
    fatalError("Expected two arguments: [date (1–21)] [puzzle A|B]")
}

let date = CommandLine.arguments[1]
let puzzle = CommandLine.arguments[2].uppercased()

switch (date, puzzle) {
case ("1", "A"):
    print("Running first puzzle for 1/12")
    print("-----------------------------")
    print("")
    print("Result: \(firstOfFirst())")
    break
case ("1", "B"):
    print("Running second puzzle for 1/12")
    print("------------------------------")
    print("")
    print("Result: \(secondOfFirst())")
case ("2", "A"):
    print("Running first puzzle for 2/12")
    print("------------------------------")
    print("")
    print("Result: \(firstOfSecond())")
case ("2", "B"):
    print("Running second puzzle for 2/12")
    print("------------------------------")
    print("")
    print("Result: \(secondOfSecond())")
default:
    fatalError("Puzzle not implemented yet")
}
