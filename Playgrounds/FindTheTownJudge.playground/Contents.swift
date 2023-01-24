import UIKit

func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {

    if n == 1 && trust.count == 0 {
        return 1
    }

    var trusted = [Int: [Int]]()
    var judge = -1

    for trusts in trust {
        trusted[trusts[1], default: [Int]()].append(trusts[0])
    }

    if trusted.count > 0  {
        let tempJudge = trusted.reduce(into: -1) { partialResult, trustedPerson in
            if trustedPerson.value.count > trusted[partialResult, default: [Int]()].count && trustedPerson.value.count == n - 1 {
                partialResult = trustedPerson.key
            }
        }
        if !trusted.values.contains(where: { $0.contains(tempJudge)}) {
            judge = tempJudge
        }

    }


    return judge
}

findJudge(2, [[1,2]])
findJudge(3, [[1,3],[2,3]])
findJudge(3, [[1,3],[2,3],[3,1]])
findJudge(4, [[1,3],[1,4],[2,3],[2,4],[4,3]])
findJudge(4, [[1,3],[1,4],[2,3]])

