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
                printTree(n.left)
                printTree(n.right)
            case .PostOrder:
                printTree(n.left)
                printTree(n.right)
                print(n.data)
            case .InOrder:
                printTree(n.left)
                print(n.data)
                printTree(n.right)
        }
    }
}

class Node  {
    var left:Node?
    var right:Node?
    var data:Int?
    
    init(left:Node?, right:Node?, value:Int) {
        self.left = left
        self.right = right
        self.data = value
    }
    
    init(value:Int) {
        self.data = value
    }
}

var node1 = Node(left:Node(value:7), right:Node(value:9), value:5)
var node2 = Node(left:nil, right:Node(value:16), value:11)
var root = Node(left:node1, right:node2, value: 10)



func printTree(node:Node?) {
    
    guard let n = node else {
        return
    }
    
    printTree(n.left)
    print(n.data)
    printTree(n.right)

}

/*:
    InOrder
*/
//TreeOrderPrint.InOrder.printTree(root)
/*:
PreOrder
*/
TreeOrderPrint.PreOrder.printTree(root)
/*:
PostOrder
*/
TreeOrderPrint.PostOrder.printTree(root)
