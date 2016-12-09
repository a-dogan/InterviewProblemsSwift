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
    
    for i in 0 ..< input.count {
        for j in 0 ..< input[i].count {
            print(i, j, ",")
            
            transposed[rowLength - i - 1][j] = input[j][i]
        }
        
    }
    
    transposed
}


var inputArray:[[Character]] = [["a","b", "c"],["d","e","f"]]

//rotateArray(inputArray)




var input = [1, 2 ,3]



func findMaxValue(input:[Int]) -> Int {
    

    for var i=0; i < input.count; i++ {
    
        print(input[i])
        
        for var j=0; j != i && i < input.count; j++ {
        
                 print(input[j])
            
        }
        
        print("=====")
        
    }

    return 1
}

findMaxValue(input)
