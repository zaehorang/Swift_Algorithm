//
//  43165.swift
//  AlgorithmStudy
//
//  Created by zaehorang on 9/16/25.
//

import Foundation

func _43165(_ numbers:[Int], _ target:Int) {
    var cnt = 0
    
    func recursion(index: Int, current: Int) {
        if index == numbers.count - 1 {
            if current == target { cnt += 1 }
            return
        }
        
        recursion(index: index + 1, current: current + numbers[index + 1])
        recursion(index: index + 1, current: current - numbers[index + 1])
        
    }
    
    recursion(index: -1, current: 0)
    
    print(cnt)
}
