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

func findTilt(_ root: TreeNode?) -> Int {

    guard let root = root else {
        return 0
    }

    var result = 0

    calcDiff(node: root)

    calcTotalTilt(node: root, value: &result)

    return result
}

func retrieveValues(node: TreeNode?) -> Int {

    guard let node = node else {
        return 0
    }

    var leftNodeValue = node.left != nil ? node.left!.val : 0
    var rightNodeValue = node.right != nil ? node.right!.val : 0

    if let left = node.left {
        leftNodeValue += retrieveValues(node: left)
    }

    if let right = node.right {
        rightNodeValue += retrieveValues(node: right)
    }

    return leftNodeValue + rightNodeValue
}

func calcDiff(node: TreeNode?) {

    guard let node = node else {
        return
    }
    print("in node: \(node.val) --- > \(retrieveValues(node: node.left) + (node.left?.val ?? 0))  - \(retrieveValues(node: node.right) + (node.right?.val ?? 0)) = \(abs((retrieveValues(node: node.left) + (node.left?.val ?? 0)) - (retrieveValues(node: node.right) + (node.right?.val ?? 0))))")
    node.val = abs((retrieveValues(node: node.left) + (node.left?.val ?? 0)) - (retrieveValues(node: node.right) + (node.right?.val ?? 0)))

    calcDiff(node: node.left)
    calcDiff(node: node.right)
}

func calcTotalTilt(node: TreeNode?, value: inout Int) {
    guard let node = node else {
        return
    }
    value += node.val
    calcTotalTilt(node: node.left, value: &value)
    calcTotalTilt(node: node.right, value: &value)
}

let node0 = RootNode([1,2,3]).rootNode
let node1 = RootNode([4,2,9,3,5,nil,7]).rootNode
let node2 = RootNode([21,7,14,1,1,2,2,3,3]).rootNode

findTilt(node0)
findTilt(node1)
findTilt(node2)
