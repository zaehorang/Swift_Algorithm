//
//  re_42587.swift
//  AlgorithmStudy
//
//  Created by zaehorang on 3/6/25.
//

import Foundation

func reSolution_42587(_ priorities:[Int], _ location:Int) -> Int {
    
    var arr = priorities.enumerated().map {
        ($0.offset, $0.element)
    }
    
    while true {
        let elem = arr.removeFirst()
    
        if arr.contains(where: { elem.1 < $0.1 }) {
            arr.append(elem)
        } else {
            if location == elem.0 {
                return priorities.count - arr.count
            }
        }
        
    }
}
