//
//  2206.swift
//  AlgorithmStudy
//
//  Created by zaehorang on 5/7/24.
//  https://www.acmicpc.net/problem/2206
/*
9 9
010001000
010101010
010101010
010101010
010101010
010101010
010101010
010101011
000100010
 
 답: 33
 출력: -1
 
 
 
 
6 6
010001
010101
010101
010101
010110
000110
 ans: 21
 */

/*
 https://www.acmicpc.net/board/view/119335
 */

func _2206() {
    
    // Input
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    var table: [[Int]] = []
    for _ in 0..<n {
        table.append(readLine()!.compactMap { Int(String($0)) })
    }
    
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]
    
    var distanceTable: [[Int]] = .init(repeating: .init(repeating: -1, count: m), count: n)
    
    var queue = Queue<[Int]>()
    queue.enqueue([0, 0, 0])  // x, y, 부수기 유무
    distanceTable[0][0] = 1
    
    if n >= 2 && m >= 2 && table[n-2][m-1] == 1 && table[n-1][m-2] == 1 {
        
        while !queue.isEmpty {
            guard let prev = queue.dequeue() else { break }
            let (x, y) = (prev[0], prev[1])
            
            for i in 0..<4 {
                let (nX, nY) = (x + dx[i], y + dy[i])
                
                if ((nX == n - 2) && (nY == m - 1)) || ((nX == n - 1) && (nY == m - 2)) {
                    distanceTable[n-1][m-1] = distanceTable[x][y] + 2
                    queue.removeAll()
                }
                
                if nX < 0 || nY < 0 || nX >= n || nY >= m { continue }
                if (distanceTable[nX][nY] != -1) || (table[nX][nY] == 1) { continue }
                
                distanceTable[nX][nY] = distanceTable[x][y] + 1
                queue.enqueue([nX, nY])
            }
            
        }
        
    } else {
        
        while !queue.isEmpty {
            guard let prev = queue.dequeue() else { break }
            let (x, y, canGo) = (prev[0], prev[1], prev[2])
            
            for i in 0..<4 {
                let (nX, nY) = (x + dx[i], y + dy[i])
                
                if nX < 0 || nY < 0 || nX >= n || nY >= m { continue }
                if distanceTable[nX][nY] != -1 { continue }
                
                if table[nX][nY] == 1 { // 벽을 만나면
                    if canGo == 0 {  // 한 번 부술 수 있으면
                        distanceTable[nX][nY] = distanceTable[x][y] + 1
                        queue.enqueue([nX, nY, 1])
                    } else { // 부술 수 없으면
                        distanceTable[nX][nY] = 0 // 방문 표시만
                    }
                    
                    continue
                    
                } else {  // 그냥 길이면
                    distanceTable[nX][nY] = distanceTable[x][y] + 1
                    queue.enqueue([nX, nY, canGo])
                    
                    if (nX == n - 1) && (nY == m - 1) {
                        queue.removeAll()
                        break
                    }
                }
                
            }
        }
    }
    
    print(distanceTable[n-1][m-1])
    
}


/*
6 5
00000
11110
00000
01111
01111
00010
 */
