import UIKit

func convertToTitle(_ columnNumber: Int) -> String {
    let letters = ["A", "B", "C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S", "T","U","V","W","X","Y","Z"]
    var remainigCols = columnNumber
    var response = [String]()

//    while remainigCols > 0 {
//        if remainigCols > 26 {
//            var value = remainigCols % 26
//            if value == 0 {
//                value = letters.count
//            }
//            response.append(letters[value-1])
//            remainigCols = (remainigCols / 26)
//        } else {
//            response.append(letters[remainigCols - 1])
//            remainigCols = 0
//        }
//    }

    while remainigCols > 0 {
            remainigCols -= 1
            let currentValue = remainigCols % 26
            remainigCols = remainigCols / 26
            response.append(letters[currentValue])
    }

    return response.reversed().joined(separator: "")
}

convertToTitle(1)
convertToTitle(27)
convertToTitle(28)
convertToTitle(52)
convertToTitle(701)


// 52 -> AZ
