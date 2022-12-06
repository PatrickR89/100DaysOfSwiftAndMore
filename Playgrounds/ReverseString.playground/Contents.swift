import UIKit

func reverseString(_ s: inout [Character]) {


    if s.count > 1 {
        var j = s.count - 1
        var i = 0
        while j >= s.count / 2 {
                let tempChar = s[i]
                s[i] = s[j]
                s[j] = tempChar

            i += 1
            j -= 1
        }
    }
}

var str1: [Character] = ["h","e","l","l","o"]
var str2: [Character] = ["H","a","n","n","a","h"]
var str3: [Character] = ["d","a"]
reverseString(&str1)
reverseString(&str2)
reverseString(&str3)
