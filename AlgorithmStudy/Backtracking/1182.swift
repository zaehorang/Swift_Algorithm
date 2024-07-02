//
//  1182.swift
//  AlgorithmStudy
//
//  Created by zaehorang on 7/2/24.
//  https://www.acmicpc.net/problem/1182
//  부분 수열의 합

//  이전에 풀었던 백트래킹과 다름.
//  앞서 풀었던 문제들은 다 연속되는 수열임
func _1182() {
    let ns = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, s) = (ns[0], ns[1])
    
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    
    var ans = 0
    recursion(k: 0, tot: 0)
    
    func recursion(k: Int, tot: Int) {
        if k == n {
            if tot == s {
                ans += 1
            }
            return
        }
        
        recursion(k: k + 1, tot: tot)
        recursion(k: k + 1, tot: tot + nums[k])
    }
    if s == 0 {
        print(ans - 1)
    } else {
        print(ans)
    }
}
