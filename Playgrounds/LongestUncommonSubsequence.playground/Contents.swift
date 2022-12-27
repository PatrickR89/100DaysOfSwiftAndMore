import UIKit

func findLUSlength(_ a: String, _ b: String) -> Int {

    if a == b {
        return -1
    }

    return a.count > b.count ? a.count : b.count

//    let aTemp = a.count > b.count ? Array(a) : Array(b)
//    let bTemp = a.count > b.count ? Array(b) : Array(a)
//
//    var aCounter = 0
//    var bCounter = 0
//
//    while aCounter < aTemp.count && bCounter < bTemp.count {
//        if bTemp[bCounter] == aTemp[aCounter] {
//
//            print("\(bTemp[bCounter]) == \(aTemp[aCounter])")
//            bCounter += 1
//        }
//
//        aCounter += 1
//    }
//
//    print(aCounter, bCounter)
//
//
//    return aCounter - bCounter > 0 ? aCounter - bCounter : -1
    }

//findLUSlength("aba", "cdc")
//findLUSlength("aaa", "aaa")
findLUSlength("aefawfawfawfaw", "aefawfeawfwafwaef")
