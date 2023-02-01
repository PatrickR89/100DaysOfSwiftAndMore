import UIKit

func backspaceCompare(_ s: String, _ t: String) -> Bool {

    let s = Array(s).map {String($0)}
    let t = Array(t).map {String($0)}

    var charS = [String]()
    var charT = [String]()
    var indexS = 0
    var indexT = 0

    while indexS < s.count {
        if s[indexS] == "#" && !charS.isEmpty {
            charS.removeLast()
        } else if s[indexS] != "#" {
            charS.append(s[indexS])

        }
        indexS += 1
    }

    while indexT < t.count {
        if t[indexT] == "#" && !charT.isEmpty {
            charT.removeLast()
        } else if t[indexT] != "#" {
            charT.append(t[indexT])

        }
        indexT += 1
    }
    print(charS, charT)
    return charT == charS
}

backspaceCompare("ab#c", "ad#c")
backspaceCompare("ab##", "c#d#")
backspaceCompare("a#c", "b")
backspaceCompare("xywrrmp", "xywrrmu#p")
backspaceCompare("y#fo##f", "y#f#o##f")
