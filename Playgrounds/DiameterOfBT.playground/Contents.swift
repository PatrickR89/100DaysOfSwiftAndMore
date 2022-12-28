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

struct NodeDepth {
    var left: Int
    var right: Int
}

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {

    var diameter = 0

    let rootDepth = calcNodeDiameter(root, &diameter)

    diameter = max(diameter, (rootDepth.left + rootDepth.right))

    return diameter
}

func calcNodeDiameter(_ node: TreeNode?, _ diameter: inout Int) -> NodeDepth {
    guard let node = node else {
        return NodeDepth(left: 0, right: 0)
    }

    let left = calcNodeDiameter(node.left, &diameter)
    let right = calcNodeDiameter(node.right, &diameter)
    var deeperRight = max(right.right, right.left)
    var deeperLeft = max(left.right, left.left)



    if node.left != nil {
        deeperLeft += 1
    }

    if node.right != nil {
        deeperRight += 1
    }

    diameter = max(diameter, (deeperLeft + deeperRight))

    return NodeDepth(left: deeperLeft, right: deeperRight)
}

let node0 = RootNode([1,2,3,4,5]).rootNode
let node1 = RootNode([1, 2]).rootNode
let node2 = RootNode([4,2,6,1,3, nil, 2, nil, 3]).rootNode
let node3 = RootNode([4,-7,-3,nil,nil,-9,-3,9,-7,-4,nil,6,nil,-6,-6,nil,nil,0,6,5,nil,9,nil,nil,-1,-4,nil,nil,nil,-2]).rootNode

diameterOfBinaryTree(node0)
diameterOfBinaryTree(node1)
diameterOfBinaryTree(node2)
diameterOfBinaryTree(node3)
