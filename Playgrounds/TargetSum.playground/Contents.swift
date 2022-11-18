import UIKit

// Definition for a binary tree node.
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
                    array.insert(nil, at: 2 * index + 2)
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
                        array.insert(nil, at: 2 * index + 2)
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

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    if root == nil {
        return false
    }

    let finalValue = reduceSum(root, value: targetSum)

    func reduceSum(_ node: TreeNode?, value: Int) -> Int {

        let secondValue = value - node!.val

        if node?.left == nil && node?.right == nil {
            return secondValue
        }
        var newValue = secondValue

        guard let left = node?.left else {
            return reduceSum(node?.right, value: secondValue)
        }

        newValue = reduceSum(left, value: secondValue)
        print(newValue)

        if newValue != 0 && node?.right != nil{
            newValue = reduceSum(node?.right, value: secondValue)
        }
        print(newValue)
        return newValue
    }

    return finalValue == 0
}

let target1 = 22
let target2 = 5
let target3 = 1
let target4 = -2

let node1 = RootNode([5,4,8,11,nil,13,4,7,2,nil,nil,nil,1]).rootNode
let node2 = RootNode([1,2,3]).rootNode
let node3 = RootNode([1, 2]).rootNode
let node4 = RootNode([-2,nil,-3]).rootNode

hasPathSum(node1, target1)
hasPathSum(node2, target2)
hasPathSum(node3, target3)
hasPathSum(node4, target4)
