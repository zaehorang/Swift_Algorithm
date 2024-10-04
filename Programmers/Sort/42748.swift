//
//  42748.swift
//  AlgorithmStudy
//
//  Created by zaehorang on 10/4/24.
//

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var ans = [Int]()
    
    func findK(i: Int, j: Int, k: Int) -> Int {
        var arr = [Int]()
        for idx in (i-1)...(j-1) {
            arr.append(array[idx])
        }
        return arr.sorted()[k-1]
    }
    
    for arr in commands {
        ans.append(findK(i: arr[0], j: arr[1], k: arr[2]))
    }
    return ans
}
