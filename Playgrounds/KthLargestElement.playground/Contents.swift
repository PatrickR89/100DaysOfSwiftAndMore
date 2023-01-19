import UIKit

class KthLargest {

    let k: Int
    var stream = [Int]()

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.stream = Array(nums.sorted().reversed())
    }

    func add(_ val: Int) -> Int {

        if let index = stream.firstIndex(where: {val >= $0}) {
            stream.insert(val, at: index)
        } else if stream.isEmpty {
            stream.append(val)
        } else if val > stream[0] {
            stream.insert(val, at: 0)
        } else if val < stream[stream.count - 1] {
            stream.append(val)
        }

        print(stream)

        var returnIndex = k - 1
        if returnIndex < 0 {
            returnIndex = 0
        } else if returnIndex > stream.count - 1{
            returnIndex = stream.count - 1
        }

        return stream[returnIndex]

    }
}

var newNum = KthLargest(3, [4, 5, 8, 2])
// [3], [5], [10], [9], [4]]
//newNum.add(3)
//newNum.add(5)
//newNum.add(10)
//newNum.add(9)
//newNum.add(2)
//[[2,[0]],[-1],[1],[-2],[-4],[3]]
var secondNum = KthLargest(2, [0])
secondNum.add(-1)
secondNum.add(1)
secondNum.add(-2)


