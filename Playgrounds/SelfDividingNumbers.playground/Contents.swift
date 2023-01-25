import UIKit

func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {

    var result = [Int]()

    for number in left...right {
        let tempNum = Array(String(number)).map { String($0) }.map { Int($0)!}
        var isDividible = true

        if tempNum.contains(0) {
            continue
        }

        tempNum.forEach {
            if number % $0 != 0 {
                isDividible = false
            }
        }

        if isDividible {
            result.append(number)
        }

    }

    return result
}

selfDividingNumbers(1, 22)
selfDividingNumbers(47, 85)
