import UIKit

func reverseStr(_ s: String, _ k: Int) -> String {

    var sContainer = [[Character]]()
    var containerIndex = 0
    var innerIndex = 0

    s.forEach {

        if innerIndex == 0 {
            sContainer.append([])
            containerIndex = sContainer.count - 1
        }

        if innerIndex < k - 1 {
            sContainer[containerIndex].append($0)
            innerIndex += 1
        } else {
            sContainer[containerIndex].append($0)
            innerIndex = 0
        }
    }

    for index in sContainer.indices {
        if index % 2 == 0 {
            sContainer[index].reverse()
        }
    }

    let result = Array(sContainer.joined()).map { return String($0)}.joined(separator: "")

    print(sContainer)

    return result
}

reverseStr("abcdefg", 2)
reverseStr("abcde", 2)
reverseStr("abcdefg", 8)
