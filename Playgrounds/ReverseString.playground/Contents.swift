import UIKit

func reverseString(_ s: inout [Character]) {

    if s.count > 1 {
        for i in 0...(s.count - 1) {
            s.insert(s.removeFirst(), at: s.count - i)
        }
    }
}

var str1: [Character] = ["h","e","l","l","o"]
var str2: [Character] = ["H","a","n","n","a","h"]
var str3: [Character] = ["d","a"]
reverseString(&str1)
reverseString(&str2)
reverseString(&str3)
