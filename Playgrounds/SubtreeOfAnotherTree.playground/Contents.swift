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

func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {

    if root == nil || subRoot == nil {
        return false
    }

    var result = false

    inorderTraversal(root!, subRoot!, &result)

    return result
}

func inorderTraversal(_ node: TreeNode?, _ sub: TreeNode, _ result: inout Bool) {

    guard let node = node else {
        return
    }

    if result == true {
        return
    }

    if node.val == sub.val {
        result = inorderCompare(node, sub)
    }

    inorderTraversal(node.left, sub, &result)
    inorderTraversal(node.right, sub, &result)
}

func inorderCompare(_ node: TreeNode?, _ subNode: TreeNode?) -> Bool {

    if node == nil && subNode == nil {
        return true
    }

    if node == nil || subNode == nil {
        return false
    }

    if node!.val != subNode!.val {
        return false
    }

    let left = inorderCompare(node!.left, subNode!.left)
    let right = inorderCompare(node!.right, subNode!.right)


    return left && right
}

let node0 = RootNode([3,4,5,1,2]).rootNode
let node0sub = RootNode([4,1,2]).rootNode
let node1 = RootNode([3,4,5,1,2,nil,nil,nil,nil,0]).rootNode

isSubtree(node0, node0sub)
isSubtree(node1, node0sub)
