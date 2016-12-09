//: [Previous](@previous)

import Foundation

class Node  {
    var left:Node?
    var right:Node?
    var data:Int
    
    init(left:Node?, right:Node?, value:Int) {
        self.left = left
        self.right = right
        self.data = value
    }
    
    init(value:Int) {
        self.data = value
    }
}


var nums = [1, 2, 3, 4, 5, 6, 7]


//func makeBst(nums:[Int]) -> Node {
//
//    
//    let mid  = (nums.count - 1) / 2
//
//    var n = Node(value: nums[mid])
//    var left:Node?
//    var right:Node?
//    
//    // left
//    left = makeBst(nums: _[0...mid-1])
//
//    //right
//    for _ in mid..<nums.count {
//        right = makeBst(nums:_[mid...mid-1])
//    }
//    
//    return Node(value: 8)
//}

let mid  = (nums.count - 1) / 2

print(nums[1...mid-1])
