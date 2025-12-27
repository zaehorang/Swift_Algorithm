//
//  10989.swift
//  AlgorithmStudy
//
//  Created by zaehorang on 12/26/25.
//  https://www.acmicpc.net/problem/10989

import Foundation

func _10989() {
    let n = Int(readLine()!)!
    var ans: String = ""
    var arr = [Int]()
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    arr.sorted().forEach {
        ans += String($0) + "\n"
    }
    print(ans)
}
