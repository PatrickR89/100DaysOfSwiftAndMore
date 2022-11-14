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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {

        if p == nil && q == nil {return true}

        if p == nil || q == nil {return false}
        if p?.val != q?.val {return false}

        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }


let node1 = TreeNode(1, TreeNode(2), TreeNode(3))
let node2 = TreeNode(1, TreeNode(2), TreeNode(3))

let node1a = TreeNode(1, TreeNode(2), nil)
let node2a = TreeNode(1, nil, TreeNode(2))

let node1b = TreeNode(1, TreeNode(2), TreeNode(1))
let node2b = TreeNode(1, TreeNode(1), TreeNode(2))

isSameTree(node1, node2)
isSameTree(node1a, node2a)
isSameTree(node1b, node2b)
isSameTree(nil, node1)
