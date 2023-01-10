import UIKit

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

struct LevelAvg {
    var level: Int
    var numOfNodes: Int
    var value: Double

    func returnValue() -> Double {
        return value / Double(numOfNodes)
    }
}

func averageOfLevels(_ root: TreeNode?) -> [Double] {

    guard let root = root else {
        return []
    }

    var levels: [LevelAvg] = []
    levels.append(LevelAvg(level: -1, numOfNodes: 1, value: Double(root.val)))
    traverseInNode(root, 0, &levels)

    levels = levels.filter {
        $0.numOfNodes != 0
    }

    print(levels)
    return levels.map {
        return $0.returnValue()
    }
}

func traverseInNode(_ node: TreeNode?,_ level: Int, _ levels: inout [LevelAvg]) {
    guard let node = node else {return}

    var leftChild = 0
    var rightChild = 0
    var numChildren = 0

    if let left = node.left {
        leftChild = left.val
        numChildren += 1
    }

    if let right = node.right {
        rightChild = right.val
        numChildren += 1
    }

    if let index = levels.firstIndex(where: {$0.level == level}) {
        levels[index].value += Double(leftChild + rightChild)
        levels[index].numOfNodes += numChildren
    } else {
        let newLevel = LevelAvg(level: level, numOfNodes: numChildren, value: Double(leftChild + rightChild))
        levels.append(newLevel)
    }

    traverseInNode(node.left, level + 1, &levels)
    traverseInNode(node.right, level + 1, &levels)
}

let node0 = RootNode([3,9,20,nil,nil,15,7]).rootNode

averageOfLevels(node0)
