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

func minDiffInBST(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    var result = Int(Int32.max)
    traverseForValues(root: root, result: &result)

    return result
}

func traverseForValues(root: TreeNode, result: inout Int) -> [String: Int] {
    var values: [String: Int] = ["max": root.val, "min": root.val]

    if let left = root.left {
        let leftValues = traverseForValues(root: left, result: &result)
        result = min(result, root.val - leftValues["max"]!)
        values["min"] = min(values["min"]!, leftValues["min"]!)
        values["max"] = max(values["max"]!, leftValues["max"]!)
    }

    if let right = root.right {
        let rightValues = traverseForValues(root: right, result: &result)
        result = min(result, rightValues["min"]! - root.val)
        values["min"] = min(values["min"]!, rightValues["min"]!)
        values["max"] = max(values["max"]!, rightValues["max"]!)
    }

    return values
}



let node0 = RootNode([4,2,6,1,3]).rootNode
let node1 = RootNode([1,0,48,nil,nil,12,49]).rootNode

minDiffInBST(node0)
minDiffInBST(node1)
