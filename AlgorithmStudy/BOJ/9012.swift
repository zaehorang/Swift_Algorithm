//
// 9012.swift
// Swift_Algorithm
//
// Created by zaehorang on 2026/3/17.
// https://acmicpc.net/problem/9012
//

import Foundation

func _9012() {
    // Your solution here
    let n = Int(readLine()!)!
    
    var ans = ""
    
    for _ in 0..<n {
        var stack: [Character] = []
        var isVPS = true
        
        for char in readLine()! {
            if char == "(" {
                stack.append(char)
            } else {
                guard !stack.isEmpty else {
                    isVPS = false
                    break
                }
                stack.removeLast()
            }
        }
        
        if stack.isEmpty && isVPS {
            ans += "YES\n"
        } else {
            ans += "NO\n"
        }
    }
    print(ans)
}
