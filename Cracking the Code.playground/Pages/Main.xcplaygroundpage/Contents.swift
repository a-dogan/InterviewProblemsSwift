
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
    
    //: Test for the min coin
    for coin in coins {
        if (target - coin) == 0 {
            return 1
        }
    }
    
    var minCoin = Int.max
    
    for var i=0; i<coins.count; i++ {
        let val = minimunNumberOfCoins(coins, target: (target - coins[i]))
        
        if val + 1 < minCoin {
            minCoin = val+1
        }
        
    }
    
    return minCoin
}

minimunNumberOfCoins([1,2,3], target: 7)



