//
//  main.swift
//  AlgorithmStudy
//
//  Created by zaehorang on 4/9/24.
//  https://www.acmicpc.net/problem/18258

import Foundation

//// 빠른 입력 FileIO
//final class FileIO {
//    private var buffer:[UInt8]
//    private var index: Int
//    
//    init(fileHandle: FileHandle = FileHandle.standardInput) {
//        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
//        index = 0
//    }
//    
//    @inline(__always) private func read() -> UInt8 {
//        defer { index += 1 }
//        
//        return buffer.withUnsafeBufferPointer { $0[index] }
//    }
//    
//    @inline(__always) func readInt() -> Int {
//        var sum = 0
//        var now = read()
//        var isPositive = true
//        
//        while now == 10
//                || now == 32 { now = read() } // 공백과 줄바꿈 무시
//        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
//        while now >= 48, now <= 57 {
//            sum = sum * 10 + Int(now-48)
//            now = read()
//        }
//        
//        return sum * (isPositive ? 1:-1)
//    }
//    
//    @inline(__always) func readString() -> Int {
//        var str = 0
//        var now = read()
//        
//        while now == 10
//                || now == 32 { now = read() } // 공백과 줄바꿈 무시
//        
//        while now != 10
//                && now != 32 && now != 0 {
//            str += Int(now)
//            now = read()
//        }
//        
//        return str
//    }
//}
//
//
//func stringToAscii(_ str: String) -> Int {    str.map { $0.asciiValue! }.map { Int($0) }.reduce(0) {$0 + $1}}
//
//let FRONT = stringToAscii("front")
//let EMPTY = stringToAscii("empty")
//let BACK = stringToAscii("back")
//let SIZE = stringToAscii("size")
//let POP = stringToAscii("pop")
//
//let file = FileIO()
//let n = file.readInt()
//var q = [Character]()
//
//while n > 0 {
//    let a = file.readString()
//    
//    if a == POP {
//        print(q.isEmpty ? -1 : q.removeFirst())
//    } else if a == SIZE {
//        print(q.count)
//    } else if a == EMPTY {
//        print(q.isEmpty ? 1 : 0)
//    } else if a == FRONT {
//        print(q.isEmpty ? -1 : q[0])
//    } else if a == BACK {
//        print(q.isEmpty ? -1 : q.last!)
//    } else { // push x
////        q.append(a.last!)
//    }
////    n -= 1
//}

let n = Int(readLine()!)!
var q = [String]()

for _ in 1...n {
    let a = readLine()!
    
    if a == "pop" {
        q.isEmpty ? print(-1) : print(q.removeFirst())
    } else if a == "size" {
        print(q.count)
    } else if a == "empty" {
        q.isEmpty ? print(1) : print(0)
    } else if a == "front" {
        q.isEmpty ? print(-1) : print(q[0])
    } else if a == "back" {
        q.isEmpty ? print(-1) : print(q.last!)
    } else { // push x
        let elem = String(a.split(separator: " ")[1])
        
        q.append(elem)
    }
}
