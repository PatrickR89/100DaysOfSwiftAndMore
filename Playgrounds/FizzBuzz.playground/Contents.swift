import UIKit

func fizzBuzz(_ n: Int) -> [String] {

    var answer: [String] = []

    for i in 1...n {
        if i % 5 == 0 && i % 3 == 0 {
            answer.append("FizzBuzz")
        } else if i % 5 == 0 {
            answer.append("Buzz")
        } else if i % 3 == 0 {
            answer.append("Fizz")
        } else {
            answer.append("\(i)")
        }
    }

    return answer
}

fizzBuzz(15)
fizzBuzz(2)
fizzBuzz(30)
