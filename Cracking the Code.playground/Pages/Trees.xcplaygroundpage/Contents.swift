//: [Previous](@previous)

import Foundation

enum TreeOrderPrint {
    case InOrder
    case PreOrder
    case PostOrder
    
    func printTree(node:Node?) {
        guard let n = node else {
            return
        }
        switch self {
            case .PreOrder:
                print(n.data)
                printTree(node: n.left)
                printTree(node: n.right)
            case .PostOrder:
                printTree(node:n.left)
                printTree(node:n.right)
                print(n.data)
            case .InOrder:
                printTree(node:n.left)
                print(n.data)
                printTree(node:n.right)
        }
    }
}

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

var node1 = Node(left:Node(value:3), right:Node(value:7), value:5)
var node2 = Node(left:nil, right:Node(value:16), value:11)
var root = Node(left:node1, right:node2, value: 10)


var rootIsBst = Node(left:Node(left:nil, right:nil, value:11), right:Node(left:nil, right:nil, value:11), value: 10)

func isBst(node:Node?, min:Int, max:Int) -> Bool {
    guard let n = node else {
        return true
    }
    
    if (n.data <= min || n.data > max) {
        
        return false
    }
    
    return isBst(node: n.left, min: min, max: n.data) && isBst(node:n.right, min: n.data, max: max)
}


isBst(node:root, min: Int.min, max: Int.max)

/**
/*:
InOrder
*/
TreeOrderPrint.InOrder.printTree(root)

/*:
PreOrder
*/

TreeOrderPrint.PreOrder.printTree(root)
/*:
PostOrder
*/

TreeOrderPrint.PostOrder.printTree(root)

**/
