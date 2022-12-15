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

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {

    if nums.count == 0 {return nil}
    if nums.count < 2 {
        return TreeNode(nums[0], nil, nil)
    }

    let nodes = nums.map {
        return TreeNode($0, nil, nil)
    }

    return appendValuesToBranch(nodes)
}

func appendValuesToBranch(_ nodes: [TreeNode]) -> TreeNode? {
    if nodes.count == 0 {return nil}
    if nodes.count == 1 {return nodes[0]}
    if nodes.count == 2 {
        nodes[1].left = nodes[0]
        return nodes[1]
    }

    var middle: Int = 0
    middle = nodes.count / 2
    let lesserArray = Array(nodes[0..<middle])
    let greaterArray = Array(nodes[middle + 1...nodes.count - 1])
    let lesserNode = appendValuesToBranch(lesserArray)
    let greaterNode = appendValuesToBranch(greaterArray)
    let middleNode = nodes[middle]
    middleNode.left = lesserNode
    if middleNode.left == nil {
        middleNode.left = greaterNode
    } else {
        middleNode.right = greaterNode
    }

    return middleNode
}


sortedArrayToBST([-10,-3,0,5,9])
sortedArrayToBST([1,3])
sortedArrayToBST([])
sortedArrayToBST([7])
sortedArrayToBST([0,1,2,3,4,5])
