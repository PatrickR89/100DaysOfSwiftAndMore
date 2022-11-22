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

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    var values = [Int]()
    var node = root
    var nodeStack = [TreeNode]()

    while node != nil {
        values.append(node!.val)

        if node!.right != nil {
            nodeStack.append(node!.right!)
        }

        if node!.left != nil {
            node = node!.left
        } else {
            if nodeStack.count > 0 {
                node = nodeStack.removeLast()
            } else {
                node = nil
            }
        }
    }

    return values
}

let node0 = RootNode([1,nil,2,3]).rootNode
let node1 = RootNode([5,4,8,11,nil,13,4,7,2,nil,nil,nil,1]).rootNode
let node2 = RootNode([1,2,3]).rootNode
let node3 = RootNode([1, 2]).rootNode
let node4 = RootNode([-2,nil,-3]).rootNode

preorderTraversal(node0)
preorderTraversal(node1)
preorderTraversal(node2)
preorderTraversal(node3)
preorderTraversal(node4)
