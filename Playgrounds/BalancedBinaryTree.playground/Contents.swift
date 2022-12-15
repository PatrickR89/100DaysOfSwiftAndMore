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

struct NodeDepth {
    var leftDepth: Int
    var rightDepth: Int
    var isBalanced: Bool
}

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return true
    }

    let depth = checkDepth(root)

    if depth.isBalanced {
        if depth.leftDepth == depth.rightDepth || depth.leftDepth == depth.rightDepth - 1 || depth.leftDepth == depth.rightDepth + 1 {
            return true
        }
    }

    return false
}

func checkDepth(_ node: TreeNode?) -> NodeDepth {
    if node == nil {
        return NodeDepth(leftDepth: 0, rightDepth: 0, isBalanced: true)
    }

    let left = checkDepth(node?.left)
    let right = checkDepth(node?.right)
    var deeperLeft = 0
    var deeperRight = 0
    var isBalanced = left.isBalanced && right.isBalanced

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

    if abs(deeperLeft - deeperRight) > 1 {
        isBalanced = false
    }

    return NodeDepth(leftDepth: deeperLeft + 1, rightDepth: deeperRight + 1, isBalanced: isBalanced)
}

let node1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
let node2 = TreeNode(1, TreeNode(2), TreeNode(2, TreeNode(3, TreeNode(4), TreeNode(4)), TreeNode(3)))
let node3 = TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), nil), nil), TreeNode(2, nil, TreeNode(3, nil, TreeNode(4))))

isBalanced(node1)
isBalanced(node2)
isBalanced(node3)
