import UIKit

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {

    var result = [[Int]]()
    var current = [Int]()
    let mainTarget = target

    func findTargetValue(_ index: Int, _ sum: Int ) {
        if sum > target { return }
        if sum == target { result.append(current); return}

        for index in candidates.indices {
            if candidates[index] > target { continue }
            current.append(candidates[index])
            findTargetValue(index, sum + candidates[index])
            current.removeLast()
        }
    }

    findTargetValue(0, 0)

    result = Array(Set(result.map { $0.sorted() }))

    return result
}



combinationSum([2,3,6,7], 7)
combinationSum([2,3,5], 8)
