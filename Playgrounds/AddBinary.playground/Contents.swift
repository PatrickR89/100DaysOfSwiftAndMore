import UIKit

func addBinary(_ a: String, _ b: String) -> String {
    let num1 = Array(a.reversed())
    let num2 = Array(b.reversed())
    var isCarried = false
    var result = ""
    let maxSize = max(num1.count, num2.count)

    for index in 0..<maxSize {
        let digitOne = index < num1.count ? num1[index] : "0"
        let digitTwo = index < num2.count ? num2[index] : "0"

        if digitOne == "0" && digitTwo == "0" {
            if isCarried {
                result.append("1")
            } else {
                result.append("0")
            }

            isCarried = false
        } else if digitOne == "1" && digitTwo == "1" {
            if isCarried {
                result.append("1")
            } else {
                result.append("0")
            }

            isCarried = true
        } else if digitOne == "1" || digitTwo == "1" {
            if isCarried {
                result.append("0")
            } else {
                result.append("1")
            }
        }
    }

    if isCarried {
        result.append("1")
    }


    return String(result.reversed())
    }

addBinary("11", "1")
addBinary("1010", "1011")

