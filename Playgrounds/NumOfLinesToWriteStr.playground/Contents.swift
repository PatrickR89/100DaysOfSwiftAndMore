import UIKit

func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {

    var charValues = [Character: Int]()
    let characters = Array("abcdefghijklmnopqrstuvwxyz")
    let s = Array(s)

    for index in characters.indices {
        charValues[characters[index], default: 0] = widths[index]
    }

    var numOfLines = 1
    var lastLine = 0

    for index in 0..<s.count {
        if lastLine + charValues[s[index], default: 0] == 100 {
            lastLine = lastLine + charValues[s[index], default: 0]
        } else if lastLine + charValues[s[index], default: 0] > 100 {
            numOfLines += 1
            lastLine = charValues[s[index], default: 0]
        } else {
            lastLine += charValues[s[index], default: 0]
        }
    }


    return [numOfLines, lastLine]
}

numberOfLines([10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], "abcdefghijklmnopqrstuvwxyz")
numberOfLines([4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], "bbbcccdddaaa")
numberOfLines([3,4,10,4,8,7,3,3,4,9,8,2,9,6,2,8,4,9,9,10,2,4,9,10,8,2], "mqblbtpvicqhbrejb")
