//: Cracking the Code

import Foundation
/*: 

Chapter 1

P1.1 Determine if string has unique chars.

With extra space and without

What about spaces? Do those count, can they be repeated.
Are there any characters that can be repeated? Numbers, special characters, whitespace \r\n
*/

//Extra space
func isStringUnique(string:String)->Bool {
    
    var letters = Set<Character>()
    
    for character in string.characters {
        if letters.contains(character) {
            return false
        }
        else {
            letters.insert(character)
        }
    }
    
    return true
}

//No extra space
func isStringUniqueNoExtraSpace(str:String)->Bool {
 
    for var i=0; i < str.characters.count ; i++ {
        let c = str[str.characters.startIndex.advancedBy(i)]
        
        for var j=i+1; j<str.characters.count; j++ {
            if c == str[str.characters.startIndex.advancedBy(j)] {
                return false
            }
        }
        
    }
    
    return true
}


isStringUnique("Is\r\n\n3")

isStringUniqueNoExtraSpace("abcdef")
isStringUniqueNoExtraSpace("abccdef")

