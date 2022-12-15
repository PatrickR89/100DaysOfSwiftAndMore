import UIKit


//  Definition for a binary tree node.
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

    func isSymmetric(_ root: TreeNode?) -> Bool {
        var newRoot = root
        if newRoot?.left == nil && newRoot?.right == nil {return true}
        if newRoot?.left == nil || newRoot?.right == nil {return false}
        newRoot?.right = flipTree(newRoot?.right)
        print(newRoot?.right?.right?.val)
        return compareNodes(newRoot?.left, newRoot?.right)
    }

    func flipTree(_ node: TreeNode?) -> TreeNode? {

        var newLeft = node?.left
        var newRight = node?.right

        if node?.left != nil {
             newLeft = flipTree(node?.left)
        }

        if node?.right != nil {
             newRight = flipTree(node?.right)
        }
        print(node?.val)
        return TreeNode(node!.val, newRight, newLeft)
    }

func compareNodes(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
    print("left value: \(leftNode?.val) right value: \(rightNode?.val)")
    if leftNode == nil && rightNode == nil {return true}
    if leftNode == nil || rightNode == nil {return false}
    if leftNode?.val != rightNode?.val {return false}

    return compareNodes(leftNode?.left, rightNode?.left) && compareNodes(leftNode?.right, rightNode?.right)
}


let node1 = TreeNode(1, TreeNode(2, TreeNode(3, nil, nil), TreeNode(4, nil, nil)), TreeNode(2, TreeNode(4, nil, nil), TreeNode(3, nil, nil)))
let node2 = TreeNode(1, TreeNode(2, TreeNode(3, nil, nil), nil), TreeNode(2, TreeNode(3, nil, nil), nil))
let node3 = TreeNode(1, TreeNode(0, nil, nil), nil)

isSymmetric(node1)
isSymmetric(node2)
isSymmetric(node3)
