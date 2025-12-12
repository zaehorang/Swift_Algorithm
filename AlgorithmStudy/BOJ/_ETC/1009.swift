//
//  1009.swift
//  AlgorithmStudy
//
//  Created by zaehorang on 12/12/25.
//

import Foundation

func _1009() {
    let T = Int(readLine()!)!
    
    for _ in 0..<T {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        
        let (a, b) = (ab[0], ab[1])
        
        var ans = 1
        
        let remaider = a % 10
        
        for _ in 0..<b {
            ans *= remaider
            ans %= 10
        }
        
        if ans == 0 {
            print(10)
        } else {
            print(ans)
        }
    }
}
