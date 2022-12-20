import UIKit

func constructRectangle(_ area: Int) -> [Int] {

    var width = 1
    var length = area
    var result = [[Int]]()

    while width <= length {
        let tempLength = area / width

        if width * tempLength == area {
            result.append([tempLength, width])
            length = tempLength
        }

        width += 1
    }

    let reducedResult = result.reduce(into: [Int]()) { (result, rec) in
        if result.isEmpty {
            result = rec
        } else {
            if abs(rec[0] - rec[1]) < abs(result[0] - result[1]) {
                result = rec
            }
        }
    }


    print(reducedResult)

    return reducedResult
}

constructRectangle(4)
constructRectangle(122122)
constructRectangle(1000000)
