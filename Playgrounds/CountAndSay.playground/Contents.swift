import UIKit

func countAndSay(_ n: Int) -> String {

    if n == 1 {
        return "1"
    }

    var say = "1"

    say = generateCountAndSay(n, 2, say)

    return say
}

func generateCountAndSay(_ n: Int, _ curr: Int, _ say: String) -> String {

    if curr > n {
        return say
    }

    var sayNum = Array(say.compactMap { Int(String($0))! }.reversed())
    var currNum = 0
    var counter = 0
    var newSay = ""

    for index in 0...sayNum.count {
        if index > sayNum.count - 1 {
            newSay = "\(counter)\(currNum)" + newSay
            break
        }

        if index == 0 {
            currNum = sayNum[index]
            counter = 0
        }

        if sayNum[index] == currNum {
            counter += 1
        } else {
            newSay = "\(counter)\(currNum)" + newSay
            currNum = sayNum[index]
            counter = 1
        }
    }

    return generateCountAndSay(n, curr + 1, newSay)
}

countAndSay(5)
countAndSay(4)
countAndSay(1)
countAndSay(2)
countAndSay(3)
