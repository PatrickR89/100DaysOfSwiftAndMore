import UIKit

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {return false}
    var numArray = String(x).compactMap { Int(String($0)) }
    var boolArray = [Bool]()
    for (index, number) in numArray.enumerated() {
        if numArray[numArray.count - 1 - index] == number {
            boolArray.append(true)
        } else {
            boolArray.append(false)
        }
    }
    print(boolArray.contains(false))
    print(boolArray)
    return !boolArray.contains(false)
    }

isPalindrome(121)
isPalindrome(-121)
isPalindrome(10)
isPalindrome(1000021)

