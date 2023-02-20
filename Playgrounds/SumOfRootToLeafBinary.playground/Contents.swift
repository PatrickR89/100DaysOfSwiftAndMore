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

func sumRootToLeaf(_ root: TreeNode?) -> Int {

    var stack = [String]()
    var nums = [Int]()

    traverseBT(root, &stack, &nums)

    return nums.reduce(into: 0) { partialResult, val in
        partialResult += val
    }
    }

func traverseBT(_ node: TreeNode?, _ stack: inout [String], _ nums: inout [Int]) {
    guard let node = node else {

        return
    }

    stack.append(String(node.val))

    if node.left == nil && node.right == nil {
        let binaryVal = stack.joined()
        nums.append(Int(binaryVal, radix: 2)!)
        stack.removeLast()

        return
    }

    traverseBT(node.left, &stack, &nums)
    traverseBT(node.right, &stack, &nums)
    stack.removeLast()
}

let node1 = RootNode([1,0,1,0,1,0,1]).rootNode
let node2 = RootNode([1,1]).rootNode

sumRootToLeaf(node1)
sumRootToLeaf(node2)
