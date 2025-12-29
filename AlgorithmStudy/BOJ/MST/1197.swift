//
//  1197.swift
//  AlgorithmStudy
//
//  Created by zaehorang on 12/29/25.
//

import Foundation

func _1197() {
    struct UnionFind {
        private var arr: [Int]
        
        init(_ count: Int) {
            arr = .init(repeating: -1, count: count + 1)
        }
        
        mutating func union(_ a: Int, _ b: Int) -> Bool {
            var rootA = find(a)
            var rootB = find(b)
            
            if rootA == rootB { return false }
            
            if arr[rootA] > arr[rootB] { swap(&rootA, &rootB) }
            
            if arr[rootA] == arr[rootB] { arr[rootA] -= 1 }
            
            arr[rootB] = rootA
            return true
        }
        
        mutating func find(_ a: Int) -> Int {
            if arr[a] < 0 { return a }
            arr[a] = find(arr[a])
            
            return arr[a]
        }
        
    }
    
    let VE = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (V, E) = (VE[0], VE[1])
    
    var uf = UnionFind(V)
    var edges: [[Int]] = []
    
    for _ in 0..<E {
        let abc = readLine()!.split(separator: " ").compactMap { Int($0) }
        edges.append(abc)
    }
    
    edges.sort { $0[2] < $1[2] }
    
    var cnt = 0
    var ans = 0
    
    for edge in edges {
        let (a, b ,c) = (edge[0], edge[1], edge[2])
        
        if !uf.union(a, b) { continue }
        ans += c
        cnt += 1
        
        if cnt == V - 1 { break }
    }
    print(ans)
}
