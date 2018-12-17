//  AdventOfCode
//
//  Created by Jens Söderström on 2018-12-16.
//  Copyright © 2018 Jens Söderström. All rights reserved.
//

import Foundation
let inputFile = "xcode/AdventOfCode/input.txt"
let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
let fileURL = dir!.appendingPathComponent(inputFile)
let contents = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
let lines : [String] = contents.components(separatedBy: "\n") + contents.components(separatedBy: "\n")
let intLines = lines.compactMap { Int($0) }
var sumLines = lines.compactMap { Int($0) }
var i = 0



var firstDuplicate = 0
var seen = Set<Int>([firstDuplicate])


while true {
    let change = intLines[i]
    firstDuplicate += change
    if seen.contains(firstDuplicate) {
        print(firstDuplicate)
        exit(1)
    } else {
        seen.insert(firstDuplicate)
    }
    i = (i + 1) % intLines.count
}
