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
    var leftDepth: Int
    var rightDepth: Int
}

func maxDepth(_ root: TreeNode?) -> Int {

    guard let root = root else {
        return 0
    }

    let depth = checkDepth(root)

    if depth.leftDepth > depth.rightDepth {
        return depth.leftDepth
    } else {
        return depth.rightDepth
    }
}

func checkDepth(_ node: TreeNode?) -> NodeDepth {
    if node == nil {
        return NodeDepth(leftDepth: 0, rightDepth: 0)
    }

    let left = checkDepth(node?.left)
    let right = checkDepth(node?.right)
    var deeperLeft = 0
    var deeperRight = 0

    if left.leftDepth > left.rightDepth {
        deeperLeft = left.leftDepth
    } else {
        deeperLeft = left.rightDepth
    }

    if right.leftDepth > right.rightDepth {
        deeperRight = right.leftDepth
    } else {
        deeperRight = right.rightDepth
    }

    return NodeDepth(leftDepth: deeperLeft + 1, rightDepth: deeperRight + 1)
}

let node1 = TreeNode(3, TreeNode(9, nil, nil), TreeNode(20, TreeNode(15, nil, nil), TreeNode(7, nil, nil)))
let node2 = TreeNode(1, nil, TreeNode(2, nil, nil))
let node3 = TreeNode()
let node4 = TreeNode(1)
let node5: TreeNode? = nil

maxDepth(node1)
maxDepth(node2)
maxDepth(node3)
maxDepth(node4)
maxDepth(node5)
