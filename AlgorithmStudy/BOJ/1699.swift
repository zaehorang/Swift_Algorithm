//
// 1699.swift
// Swift_Algorithm
//
// Created by zaehorang on 2026/3/16.
// https://acmicpc.net/problem/1699
//

import Foundation

/*
 최소 개수를 구해야 해서 틀린 풀이
 */
func _1699() {
    // Your solution here
    let n = Int(readLine()!)!
    
    var target = n
    var ans = 0
    
    while true {
        print(target)
        guard target > 0 else {
            print(ans)
            return
        }
        
        let new = Int(Double(target).squareRoot())
        ans += 1
        
        target -= (new * new)
    }
}

/*
 시간초과
 */
func _1699_1() {
    // Your solution here
    let n = Int(readLine()!)!
    
    guard n > 1 else {
        print(1)
        return
    }
    
    var dp: [Int] = .init(repeating: 0, count: n + 1)
    dp[1] = 1
    
    func isSquareN(_ n: Int) -> Bool {
        let a = Int(Double(n).squareRoot())
        return a * a == n
    }
    
    for i in 2...n {
        guard !isSquareN(i) else {
            dp[i] = 1
            continue
        }
        var count = Int.max
        
        for x in 1...(i/2) {
            let y = i - x
            count = min(count, dp[x] + dp[y])
        }
        dp[i] = count
    }
    print(dp[n])
}

/*
 dp[i] = i를 제곱수들의 합으로 나타낼 때 필요한 최소 개수
 
 i를 만들 때, 마지막에 사용하는 제곱수를 j*j라고 생각한다.
 그러면 남은 값은 i - j*j 이고,
 i를 만드는 최소 개수는 dp[i - j*j] + 1 중 최솟값이 된다.
 
 점화식:
 dp[i] = min(dp[i - j*j] + 1)   (단, j*j <= i)
 */
func _1699_2() {
    // Your solution here
    let n = Int(readLine()!)!
    var dp: [Int] = .init(repeating: 0, count: n + 1)

    for i in 1...n {
        var count = Int.max
        for j in 1...Int(Double(i).squareRoot()) {
            count = min(count, dp[i-j*j] + 1)
        }
        dp[i] = count
    }
    print(dp[n])
}
