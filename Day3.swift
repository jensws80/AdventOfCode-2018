//
//  AdventOfCode
//
//  Created by Jens Söderström on 2018-12-20.
//

import Foundation
let inputFile = "xcode/AdventOfCode/input.txt"
let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
let fileURL = dir!.appendingPathComponent(inputFile)
let contents = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)

struct Point: Hashable {
    let x: Int
    let y: Int
}

let points = contents.split(separator: "\n").map { line -> (id: Int, start: Point, size: Point) in
    let components = line.split(whereSeparator: { " #@,:x".contains($0) }).map { Int($0)! }
     return (components[0], Point(x: components[1], y: components[2]), Point(x: components[3], y: components[4]))
}

// part 1 104126
var dict: [Point: Int] = [:]
points.forEach { el in
    for x in stride(from: el.start.x, to: (el.start.x + el.size.x), by: 1) {
        for y in stride(from: el.start.y, to: (el.start.y + el.size.y), by: 1) {
            dict[Point(x: x, y: y), default: 0] += 1
        }
    }
}
print("part 1: ", dict.values.filter({ $0 >= 2 }).count)

// Part 2 695
outerFor: for el in points {
    for x in stride(from: el.start.x, to: (el.start.x + el.size.x), by: 1) {
        for y in stride(from: el.start.y, to: (el.start.y + el.size.y), by: 1) {
            if dict[Point(x: x, y: y)] != 1 {
                continue outerFor
            }
        }
        
    }
    print("part 2: ", el.id)
}
