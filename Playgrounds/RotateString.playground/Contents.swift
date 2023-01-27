import UIKit

func rotateString(_ s: String, _ goal: String) -> Bool {

    if s.count != goal.count {
        return false
    }

    var s = Array(s).map { String($0) }
    var counter = 0
    var result = false

    while !result && counter < s.count {

        if s.joined() == goal {
            result = true
        }

        let switchLetter = s.removeFirst()
        s.append(switchLetter)

        counter += 1
    }

    return result
}

rotateString("abcde", "cdeab")
rotateString("abcde", "cedab")

