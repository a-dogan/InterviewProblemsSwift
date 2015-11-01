
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
    var counts = [Int](count: numbers.count, repeatedValue: 0)
    

    for var i=0;  i<numbers.count; i++ {
        
        counts[i] = 1
        
        for var j=i-1; j>=0; j-- {

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
    
    for var i=0; i<coins.count; i++ {
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
    
    var fibValues = [Int](count: num+1, repeatedValue: 0)
    
    fibValues[0]=0
    fibValues[1]=1
    
    //OR...var fibValues = [0:0, 0:1]
    
    for var i=0; i<=num; i++ {
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
    
    var matrix = Array(count:rowsString1, repeatedValue:Array(count:columnsString2, repeatedValue:0))
    
    var maxLength = 0
    
    for var i=1; i<rowsString1; i++ {
        let char1 = string1[string1.characters.startIndex.advancedBy(i-1)]
        
        for var j=1; j<columnsString2; j++ {
            let char2 = string2[string2.characters.startIndex.advancedBy(j-1)]
            
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
    
    var matrix = Array(count:rowsString1, repeatedValue:Array(count:columnsString2, repeatedValue:0))
    
    var maxLength = 0
    
    for var i=1; i<rowsString1; i++ {
        let char1 = string1[string1.characters.startIndex.advancedBy(i-1)]
        
        for var j=1; j<columnsString2; j++ {
            let char2 = string2[string2.characters.startIndex.advancedBy(j-1)]
            
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
    
    var increasing = [Int](count: input.count, repeatedValue: 1)
    
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

        slow++
        
        if slow == fast {
            fast++
            slow = 0
        }
    }
    
    return longest
}

longestIncreasingSubSequence([3, 4, -1, 5])
longestIncreasingSubSequence([3, 4, -1, 0, 6, 2, 3])

/*:
Find the longest bitonic
* example given [12, 4, 8, 90, 45, 23]
* longest bittonic 4, 78, 90, 45, 23
*/


func longestBittonic(input:[Int]) -> [Int] {
    
    var increasing = [Int](count: input.count, repeatedValue: 1)
    var decreasing = [Int](count: input.count, repeatedValue: 1)
    var maxBittonic = -1
    
    for var i=1; i<input.count; i++ {
        
        if input[i] > input[i-1] {
            increasing[i] += 1
        }
    }
    
    //decreasing array
    var minimumDecreasing = input[input.count - 1]
    
    for var j=input.count-2; j>=0; j-- {
        if input[j+1] < minimumDecreasing {
                minimumDecreasing = input[j+1]
        }
        
        if input[j] < input[j+1] && input[j] < minimumDecreasing {
            decreasing[j] += 1
        }
    }
    
    for var k = 0; k < increasing.count; k++ {
        
        let newValue = increasing[k] + decreasing[k]
        if maxBittonic < newValue {
            maxBittonic = newValue
        }
        
    }
    
    return [maxBittonic]
}

//longestBittonic([1, 2, 3, -1, -1])
//longestBittonic([1, 1, 1, 1, 1])
