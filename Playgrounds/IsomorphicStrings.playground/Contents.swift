import UIKit

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    let sArr = Array(s)
    let tArr = Array(t)

    var sChar = sArr[0]
    var tChar = tArr[0]

    for index in sArr.indices {

        if sArr[index] != sChar {
            sChar = sArr[index]
            if tArr[index] == tChar {
                return false
            } else {
                tChar = tArr[index]
            }
        } else {
            if tArr[index] != tChar {
                return false
            }
        }

        if sArr.firstIndex(of: sArr[index]) != tArr.firstIndex(of: tArr[index]) {
            return false
        }

        print("schar \(sChar) sarr \(sArr[index])")
        print("tchar \(tChar) tarr \(tArr[index])")
    }

    return true
}

//isIsomorphic("egg", "add")
//isIsomorphic("foo", "bar")
//isIsomorphic("paper", "title")
isIsomorphic("badc", "baba")
