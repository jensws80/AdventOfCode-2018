//
//  main.swift
//  AdventOfCode
//
//  Created by Jens Söderström on 2018-12-16.
//  Copyright © 2018 Jens Söderström. All rights reserved.
//

import Foundation
let inputFile = "xcode/input.txt"
let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
let fileURL = dir!.appendingPathComponent(inputFile)


let contents = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
let lines : [String] = contents.components(separatedBy: "\n")
let intLines = lines.compactMap { Int($0) }

var resultingFrequency = intLines.reduce(0, +)
print(resultingFrequency)
