import UIKit

func climbStairs(_ n: Int) -> Int {
    var coveredSteps = [1, 1]

    if n == 0 {return 0}
    if n == 1 {return 1}
    if n == 2 {return 2}

    for i in 2...n {
        coveredSteps.append(coveredSteps[i - 1] + coveredSteps[i - 2])
    }

    return coveredSteps[n]
}

func secondClimb(_ n: Int) -> Int {
    if n == 0 {return 0}
    if n == 1 {return 1}
    if n == 2 {return 2}

    var oneSteps = 2
    var twoSteps = 1
    var allSteps = 0

    for _ in 2...n {
        allSteps = oneSteps + twoSteps
        twoSteps = oneSteps
        oneSteps = allSteps
    }

    return allSteps
}

//climbStairs(2)
//climbStairs(3)
//climbStairs(4)
//climbStairs(5)
//climbStairs(10)
//climbStairs(40)
//climbStairs(80)

secondClimb(2)
secondClimb(3)
secondClimb(4)
secondClimb(5)
secondClimb(10)
secondClimb(40)
secondClimb(90)
