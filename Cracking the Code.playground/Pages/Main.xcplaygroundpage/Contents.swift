
//: # Find the count of the Longest increasing subsequence in the array
/*:

Example:
for [8, 19, 5, 4, 9, 16]
Longest increasing would be 8, 9, 16 or 4, 9, 16 also works

[7, 3, 2, 8, 10, 12, 5]
Longest increasing would be 7, 8, 10, 12 or 2, 8, 10, 12

*/
func longestSubSequence(numbers:[Int]) -> Int{
    var maxSequence = -1
    var counts = [Int](repeating: 0, count: numbers.count)
    
    
    for i in 0..<numbers.count {
        
        counts[i] = 1
        var j = i - 1
        
        while j > 0 {
            counts[i] = 1
            
            if numbers[j] < numbers[i] {
                
                counts[i] += 1
                if counts[j] > 1 && counts[j] > counts[i] {
                    counts[i] = counts[i] + counts[j]
                }
                
                if maxSequence < counts[i] {
                    maxSequence = counts[i]
                }
            }
            
            j += -1
        }
        
        if maxSequence < 0 {
            maxSequence = 1
        }
    }
    
    counts
    return maxSequence
}
//:Given [8, 9, 3, 10] find the longest increasing substring
//longestSubSequence([8,9,3,10])

/*:
 # Find the minimum number of coins needs to make a given amount
 * Given coins of different denominations, example [1,2,3]
 * Given a target value to find using the minimum number of coins given
*/

//: Recursive solution O(n!) running time
func minimunNumberOfCoins(coins:[Int], target:Int) -> Int {
    
    var minCoin = Int.max
    
    for i in 0..<coins.count {
        var val = 1
        
        if val >= coins[i] {
            val += 1
            val
        }
        
        if val < minCoin {
            minCoin = val
        }
        
    }
    
    return minCoin
}

/**
let target=4
let coins=[1,2,4]
minimunNumberOfCoins(coins, target: target)
**/


/*: 
  Get the fibonacci series for a number.
  Iterative Fibonacci Series
*/

func printFibonacci(num:Int) {
    
    if num - 1 > Int.max {
        print(0)
    }
    
    var fibValues = [Int](repeating: 0, count: num+1)
    
    fibValues[0]=0
    fibValues[1]=1
    
    //OR...var fibValues = [0:0, 0:1]
    
    for i in 0...num {
        if i==0 || i==1 {
            continue
        }

        fibValues[i] = fibValues[i-1] + fibValues[i-2]
    }
    
    print(fibValues, separator: ",", terminator: "")
}

//printFibonacci(20)

/*:
Find the longgest common substring for two strings. DP method
*/

func findLongestCommonSubstring(string1:String, string2:String) -> Int {
    let rowsString1 = string1.characters.count+1
    let columnsString2 = string2.characters.count+1
    
    var matrix = Array(repeating:Array(repeating:0, count:columnsString2), count:rowsString1)
    
    var maxLength = 0
    
    func charAtOffsetFrom(_ string:String, offSetBy:Int) ->String.CharacterView.Index {
        let startIndex = string.characters.startIndex
        return string.characters.index(startIndex, offsetBy:offSetBy)
    }
    
    for i in 1..<rowsString1 {
        let char1 = string1[charAtOffsetFrom(string1, offSetBy: i-1)]
        
        for j in 1..<columnsString2 {
            let char2 = string2[charAtOffsetFrom(string2, offSetBy: j-1)]
            
            if char1 == char2 {
                matrix[i][j] = 1 + matrix[i-1][j-1]
                
                let lengthNow = matrix[i][j]
                
                if maxLength < lengthNow {
                    maxLength = lengthNow
                }
            }
        
        }
    }
    
    return maxLength
}


//var string1=""
//var string2=""
//var msg = "for " + string1 + " " + string2
//var val = findLongestCommonSubstring(string1, string2: string2)
//print("Should be 0 \(msg):",val)
//
//string1 = "bgt"
//string2 = "xxabc"
//val = findLongestCommonSubstring(string1, string2: string2)
//print("Should be 1 \(msg):",val)
//
//string1 = "xxabcdeft"
//string2 = "abcdefssss"
//val = findLongestCommonSubstring(string1, string2: string2)
//print("Should be 6 \(msg):",val)


 /*:
 Find the longgest common substring for two strings. DP method
 */

func findLongestCommonSubstring(string1:String, string2:String) -> String {
    let rowsString1 = string1.characters.count+1
    let columnsString2 = string2.characters.count+1
    var endposition = 0
    
    var matrix = Array(repeating:Array(repeating:0, count:columnsString2), count:rowsString1)
    var maxLength = 0
    
    func charAtOffsetFrom(_ string:String, offSetBy:Int) ->String.CharacterView.Index {
        let startIndex = string.characters.startIndex
        return string.characters.index(startIndex, offsetBy:offSetBy)
    }
    
    for i in 1..<rowsString1 {
         let char1 = string1[charAtOffsetFrom(string1, offSetBy: i-1)]
        
        for j in 1..<columnsString2 {
            let char2 = string2[charAtOffsetFrom(string2, offSetBy: j-1)]
            
            if char1 == char2 {
                matrix[i][j] = 1 + matrix[i-1][j-1]
                
                let lengthNow = matrix[i][j]
                
                if maxLength < lengthNow {
                    maxLength = lengthNow
                    endposition = j
                }
            }
            
        }
    }
    
    //NOT COMPLETE
    return ""
}


/*:
Find the longest increasing sub sequece
* example given [3, 4, -1, 0, 6, 2, 3]
* longest increasing sub sequence is 4 = [-1, 0, 2, 3]
*/
func longestIncreasingSubSequence(input:[Int]) -> Int {
    var longest = Int.min
    
    var increasing = [Int](repeating: 1, count: input.count)
    
    var fast = 1
    var slow = 0
    
    while fast <= input.count-1 {
        
        if input[fast] > input[slow] {
            //only increase if the prev longest is greater then current longest
            if increasing[slow] + 1 > increasing[fast] {
                increasing[fast] = increasing[slow] + 1
                longest = increasing[fast]
            }
        }

        slow += 1
        
        if slow == fast {
            fast += 1
            slow = 0
        }
    }
    
    return longest
}

longestIncreasingSubSequence(input: [3, 4, -1, 5])
longestIncreasingSubSequence(input: [3, 4, -1, 0, 6, 2, 3])

/*:
Find the longest bitonic
* example given [12, 4, 8, 90, 45, 23]
* longest bittonic 4, 78, 90, 45, 23
*/


func longestBittonic(input:[Int]) -> [Int] {
    var increasing = [Int](repeating: 1, count: input.count)
    var decreasing = [Int](repeating: 1, count: input.count)
    
    var maxBittonic = -1
    
    for i in 1..<input.count {
        if input[i] > input[i-1] {
            increasing[i] += 1
        }
    }
    
    //decreasing array
    var minimumDecreasing = input[input.count - 1]
    
    var j=input.count-2
    
    while j>=0 {
        if input[j+1] < minimumDecreasing {
            minimumDecreasing = input[j+1]
        }
        
        if input[j] < input[j+1] && input[j] < minimumDecreasing {
            decreasing[j] += 1
        }

        
        j -= 1
    }

    var k = 0
    while k < increasing.count {
        
        let newValue = increasing[k] + decreasing[k]
        if maxBittonic < newValue {
            maxBittonic = newValue
        }
        
        k += 1
    }
    
    return [maxBittonic]
}

longestBittonic(input: [1, 2, 3, -1, -1])
longestBittonic(input: [1, 1, 1, 1, 1])
