import UIKit

func calPoints(_ operations: [String]) -> Int {

    var result = 0
    var results = [Int]()

    for operation in operations {
        if let num = Int(operation) {
            results.append(num)
        }

        if operation == "C" {
            results.removeLast()
        }

        if operation == "D" {
            results.append(results[results.count - 1] * 2)
        }

        if operation == "+" {
            let secondScore = results[results.count - 1]
            let firstScore = results[results.count - 2]

            results.append(firstScore + secondScore)
        }
    }
    
    result = results.reduce(into: 0) {
        $0 = $0 + $1
    }
    return result
}

calPoints(["5","2","C","D","+"])
calPoints(["5","-2","4","C","D","9","+","+"])
calPoints(["1","C"])
