import UIKit

func countSegments(_ s: String) -> Int {

    if s.count == 0 {return 0}

    var tempString = ""
    var counter = 0

    s.forEach {
        if $0 == " " {
            tempString += String($0)
        } else {
            if tempString.count > 0 {
                counter += 1
            }
            tempString = ""
        }
    }

    if s.contains(where: {$0 != " "}) && s.first != " " {
        counter += 1
    }

    return counter
}

countSegments("Hello, my name is John")
countSegments("Hello")
countSegments("")
countSegments("           ")
countSegments("    foo    bar")
