//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


var d = [String: Int]()


d["hello"]=1


if (d["hello"] != nil) {
    print("Has key")
}



func rotateArray(input:[[Character]]) {
    var transposed = [[Character]]()
    let rowLength = input[0].count
    
    transposed.append(input[0])
    transposed.append(input[1])
    
    for var i=0; i < input.count; i++ {
        for var j=0; j < input[i].count; j++ {
            transposed[rowLength - i - 1][j] = input[j][i]
        }
        
    }
    
    transposed
}


var inputArray:[[Character]] = [["a","b"],["c","d"]]

rotateArray(inputArray)