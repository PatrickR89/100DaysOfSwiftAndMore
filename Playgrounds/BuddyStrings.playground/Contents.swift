import UIKit

func buddyStrings(_ s: String, _ goal: String) -> Bool {

    let s = Array(s)
    let goal = Array(goal)
    if s.count != goal.count { return false }
    if s == goal && s.count > Set(s).count { return true }
    var difference = [Int]()

    for index in s.indices {
        if s[index] != goal[index] {
            difference.append(index)
        }
    }

    if difference.count == 2 && s[difference[0]] == goal[difference[1]] && s[difference[1]] == goal[difference[0]] {return true}

    return false
}

buddyStrings("ab", "ba")
buddyStrings("abalalalala", "abalaaaalll")
