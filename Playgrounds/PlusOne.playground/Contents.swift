import UIKit

func plusOne(_ digits: [Int]) -> [Int] {
    var tempDigits = Array(digits.reversed())

    for (index, digit) in tempDigits.enumerated() {
        if index == 0 {
            tempDigits[index] += 1
            if tempDigits[index] == 10 {
                tempDigits[index] = 0
                if tempDigits.count - 1 >= index + 1 {
                    tempDigits[index + 1] += 1
                } else {
                    tempDigits.append(1)
                }
            }
        }

        if index > 0 {
            if tempDigits[index] != digit && tempDigits[index] == 10 {
                tempDigits[index] = 0
                if tempDigits.count - 1 >= index + 1 {
                    tempDigits[index + 1] += 1
                } else {
                    tempDigits.append(1)
                }
            }
        }
    }

    print(Array(tempDigits.reversed()))
    return Array(tempDigits.reversed())
    }

plusOne([1,2,3])
plusOne([4,3,2,1])
plusOne([9])
plusOne([9,9])

plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6])

