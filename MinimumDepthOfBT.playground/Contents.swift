import UIKit

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

struct NodeDepth {
    var leftDepth: Int?
    var rightDepth: Int?
}

func minDepth(_ root: TreeNode?) -> Int {

    guard let root = root else {
        return 0
    }

    let depth = checkDepth(root)

    guard let result = findNodeDepth(depth) else {
        return 0
    }

    return result
}

func checkDepth(_ node: TreeNode?) -> NodeDepth? {
    var deeperLeft: Int? = 0
    var deeperRight: Int? = 0
    if node == nil {
        return NodeDepth(leftDepth: nil, rightDepth: nil)
    }

    if node?.left == nil && node?.right == nil {
        return NodeDepth(leftDepth: 0, rightDepth: 0)
    }

    let left = checkDepth(node?.left)
    let right = checkDepth(node?.right)


    deeperLeft = findNodeDepth(left)
    deeperRight = findNodeDepth(right)

    return NodeDepth(leftDepth: deeperLeft, rightDepth: deeperRight)
}

func findNodeDepth(_ depth: NodeDepth?) -> Int? {
    if let depth = depth {
        if let leftLeft = depth.leftDepth,
           let leftRight = depth.rightDepth {
            if leftLeft < leftRight {
                return leftLeft + 1
            } else {
                return leftRight + 1
            }
        }

        if depth.leftDepth == nil {
            if let rightD = depth.rightDepth {
                return rightD + 1
            }
        }

        if depth.rightDepth == nil {
            if let leftD = depth.leftDepth {
                return leftD + 1
            }
        }

    }
    return nil
}

let node1 = TreeNode(3, TreeNode(9, nil, nil), TreeNode(20, TreeNode(15, nil, nil), TreeNode(7, nil, nil)))
let node2 = TreeNode(1, nil, TreeNode(2, nil, nil))
let node3 = TreeNode()
let node4 = TreeNode(1)
let node5: TreeNode? = nil

minDepth(node1)
minDepth(node2)
minDepth(node3)
minDepth(node4)
minDepth(node5)

var testNode = createTreeNode([3,9,20,nil,nil,15,7])
var testNode2 = createTreeNode([2,nil,3,nil,4,nil,5,nil,6])

minDepth(testNode)
minDepth(testNode2)

func createTreeNode(_ nums: [Int?]) -> TreeNode? {

    var nodes: [TreeNode?] = nums.map {
        if let num = $0 {
            return TreeNode(num)
        } else {
            return nil
        }
    }

    var root = nodes[0]
    nodes.removeFirst()

    root = appendNodes(root, &nodes)

    return root
}

func appendNodes(_ node: TreeNode?, _ array: inout [TreeNode?]) -> TreeNode? {
    if node == nil {return nil}

    if !array.isEmpty {
        node?.left = array[0]
        if array.count > 1 {
            node?.right = array[1]
            array.remove(at: 1)
        }
        array.remove(at: 0)
    }



    let leftNode = appendNodes(node?.left, &array)
    let rightNode = appendNodes(node?.right, &array)

    node?.left = leftNode
    node?.right = rightNode

    return node
}
