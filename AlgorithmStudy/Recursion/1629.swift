//
//  1629.swift
//  AlgorithmStudy
//
//  Created by zaehorang on 5/29/24.
//  https://www.acmicpc.net/problem/1629
// 곱셈

func _1629() {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])

    print(recursion_1629(a: a, b: b, c: c))
}

func recursion_1629(a: Int, b: Int, c: Int) -> Int {
    if b == 1 { return a % c }
    
    if b % 2 == 0 {
        let k = recursion_1629(a: a, b: b / 2, c: c)
        return k % c * k % c
    } else {
        let k = recursion_1629(a: a, b: b / 2, c: c)
        return k % c * k % c * a % c
    }
}

