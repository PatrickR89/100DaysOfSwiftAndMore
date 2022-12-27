import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class RootNode {
    var rootNode: TreeNode?

    init(_ array: [Int?]) {
        self.rootNode = insertLevel(insertNils(array: array), 0)
    }

    func insertLevel(_ array: [Int?], _ index: Int) -> TreeNode? {

        var root: TreeNode? = nil
        if index < array.count {
            guard let value = array[index] else {
                return nil
            }
            root = TreeNode(value, nil, nil)

            root?.left = insertLevel(array, 2 * index + 1)
            root?.right = insertLevel(array, 2 * index + 2)
        }
        return root
    }

    func insertNils(array: [Int?]) -> [Int?] {
        var array = array
        var tempIndex = [Int]()

        for (index, digit) in array.enumerated() {
            if digit == nil {
                if 2 * index + 1 < array.count {
                    array.insert(nil, at: 2 * index + 1)
                    array.insert(nil, at: 2 * index + 1)
                    tempIndex.append(2 * index + 1)
                    tempIndex.append(2 * index + 2)
                }
            }
        }
        if !tempIndex.isEmpty {
            while 2 * tempIndex[0] + 2 < array.count {
                for index in tempIndex {
                    if 2*index+2 < array.count {
                        array.insert(nil, at: 2 * index + 1)
                        array.insert(nil, at: 2 * index + 1)
                        tempIndex.append(2 * index + 1)
                        tempIndex.append(2 * index + 2)
                        tempIndex.sort()
                    }

                    let indOfIndex = tempIndex.firstIndex(where: {$0 == index})
                    tempIndex.remove(at: indOfIndex!)
                }
            }
        }
        return array
    }
}

func findMode(_ root: TreeNode?) -> [Int] {

    if root == nil {
        return []
    }

    var node = root
    var stack = [TreeNode]()
    var result = [Int: Int]()

    while node != nil {

        if result[node!.val] == nil {
            result[node!.val] = 1
        } else {
            result[node!.val]! += 1
        }

        if node!.left != nil {
            stack.append(node!.left!)
        }

        if node!.right != nil {
            node = node!.right!
        } else {
            if stack.count > 0 {
                node = stack.removeLast()
            } else {
                node = nil
            }
        }
    }

    let topRepeat = result.reduce(0) { resultValue, dict in
        if dict.value > resultValue {
            return dict.value
        } else {
            return resultValue
        }
    }

    result = result.filter {
        $0.value == topRepeat
    }

    print(result)

    return result.map {
        return $0.key
    }
}

let node0 = RootNode([1,nil,0,0,1,1,0]).rootNode

findMode(node0)
