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

func inorderTraversal(_ root: TreeNode?) -> [Int] {

    var inorderArray = [Int]()
    var nodeStack = [TreeNode]()
    var root = root

    while root != nil || !nodeStack.isEmpty {

        if let tempRoot = root {
            nodeStack.append(tempRoot)
            root = tempRoot.left
        } else {
            root = nodeStack.popLast()
            let value = root!.val
            inorderArray.append(value)
            root = root!.right
        }
    }

    return inorderArray
}

let nodeTree = TreeNode(1, nil, TreeNode(2, TreeNode( 3, nil, nil), nil))
let nodeNil = TreeNode()
let nodeTreeSm = TreeNode(1)
inorderTraversal(nodeTree)
inorderTraversal(nodeNil)
inorderTraversal(nodeTreeSm)
