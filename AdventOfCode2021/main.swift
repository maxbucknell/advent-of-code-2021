//
//  main.swift
//  AdventOfCode2021
//
//  Created by Max Bucknell on 2/12/21.
//

import Foundation
import MBAdventKit2021

if (CommandLine.argc != 3) {
    fatalError("Expected two arguments: [date (1–21)] [puzzle A|B]")
}

let date = CommandLine.arguments[1]
let puzzle = CommandLine.arguments[2].uppercased()

func getResult(date: String, puzzle: String) -> Int? {
    switch (date, puzzle) {
    case ("1", "A"):
        return DayOneA<InputReader>().solve(input: InputReader())
    case ("1", "B"):
        return DayOneB<InputReader>().solve(input: InputReader())
    case ("2", "A"):
        return DayTwoA<InputReader>().solve(input: InputReader())
    case ("2", "B"):
        return DayTwoB<InputReader>().solve(input: InputReader())
    default:
        return nil
    }
}

guard let result = getResult(date: date, puzzle: puzzle) else {
    print("Puzzle \(date)\(puzzle) not implemented yet.")
    exit(127)
}

print("Result for \(date)\(puzzle): \(result)")
