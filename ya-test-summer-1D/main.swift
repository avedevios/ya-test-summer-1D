//
//  main.swift
//  ya-test-summer-1D
//
//  Created by ake11a on 11.09.2022.
//

import Foundation

let nString = readLine()!
let aString = readLine()!

let n = Int(nString)!
let a = aString.split(separator: " ")

func slow(n: Int, a: [Substring]) -> Int {
    var diffTime = 0
    for i in 0...n - 2 {
        for j in 1...n - 1 {
            let lastTimeString = a[i]
            let lastTimeArr = lastTimeString.split(separator: ":")
            let lastTimeTuple = (Int(lastTimeArr[0])!, Int(lastTimeArr[1])!)
            
            let currentTimeString = a[j]
            let currentTimeArr = currentTimeString.split(separator: ":")
            let currentTimeTuple = (Int(currentTimeArr[0])!, Int(currentTimeArr[1])!)
            
            
            if i == 0 || differenceTime(currentTime: currentTimeTuple, lastTime: lastTimeTuple) < diffTime {
                diffTime = differenceTime(currentTime: currentTimeTuple, lastTime: lastTimeTuple)
            }
        }
    }
    return diffTime
}

func differenceTime(currentTime: (Int, Int), lastTime: (Int, Int)) -> Int {
    var diffHour = 0
    var diffMinut = 0
    
    if lastTime.0 > currentTime.0 {
        diffHour = (24 - lastTime.0 + currentTime.0) * 60
    } else {
        diffHour = (currentTime.0 - lastTime.0) * 60
    }
    
    if lastTime.1 > currentTime.1 {
        diffMinut = 60 - lastTime.1 + currentTime.1 - 60
    } else {
        diffMinut = currentTime.1 - lastTime.1
    }
    
    return diffHour + diffMinut
}

func fast(n: Int, a: [Substring]) -> Int {
    var minutes = [Int]()
    for i in 0...n - 1 {
        let timeStr = a[i]
        let timeStrArr = timeStr.split(separator: ":")
        minutes.append(Int(timeStrArr[0])! * 60 + Int(timeStrArr[1])!)
    }
    minutes.sort()
    var minDiff = 24 * 60 + minutes[0] - minutes.last!
    
    for i in 1...n - 1 {
        minDiff = min(minDiff, minutes[i] - minutes[i - 1])
    }
    
    return minDiff
}


var ans = 0
if n > 1 {
    ans = fast(n: n, a: a)
}

print(ans)
