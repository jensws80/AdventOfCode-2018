//
//  main.swift
//  AdventOfCode
//
//  Created by Jens Söderström on 2018-12-20.
//

import Foundation
let inputFile = "xcode/AdventOfCode/input.txt"
let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
let fileURL = dir!.appendingPathComponent(inputFile)
let contents = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
let lines : [String] = contents.components(separatedBy: "\n")

var two = 0
var three = 0
    

lines.forEach { line in
    var counts = [Character: Int]()
    line.forEach { counts[$0, default: 0] += 1 }
   
    if counts.contains(where: { $0.value == 2 }) {
        two += 1
    }
    if counts.contains(where: { $0.value == 3 }) {
        three += 1
    }
}
    
print(two * three)

for (indexOne, valueOne) in lines.enumerated() {

    for (_, valueTwo) in Array(lines.dropFirst(indexOne + 1)).enumerated() {
        var diff = 0
        for (c1, c2) in zip(valueOne, valueTwo) {
            if c1 != c2 {
                diff += 1
            }
                if diff > 1 {
                    break
                }
            }
        if diff == 1 {
            print(String(zip(valueOne, valueTwo).compactMap { return ($0 == $1) ? $0 : nil }))
        }
    }
}
