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

struct NodeWithPath {
    var node: TreeNode
    var path: String
}

func binaryTreePaths(_ root: TreeNode?) -> [String] {

    if root == nil {
        return []
    }

    var node: TreeNode? = root
    var result = [String]()
    var currentPath = ""
    var rightStack = [NodeWithPath]()
    

    while node != nil {
        var tempPath = currentPath

        if node?.left == nil && node?.right == nil {
            currentPath += "\(node!.val)"
            result.append(currentPath)
            currentPath = ""
        } else {
            currentPath += "\(node!.val)->"
            tempPath = currentPath
        }

        if node?.left != nil {
            if let right = node?.right {
                rightStack.append(NodeWithPath(node: right, path: tempPath))
            }
            node = node!.left
        } else if node?.right != nil {
            node = node!.right
        } else {
            if !rightStack.isEmpty {
                let current = rightStack.removeLast()
                currentPath = current.path
                node = current.node
            } else {
                node = nil
            }
        }

    }

    return result
    }

let node1 = RootNode([1,2,3,nil,5]).rootNode
let node2 = RootNode([1]).rootNode
let node3 = RootNode([3,9,20,nil,nil,15,7]).rootNode
let node4 = RootNode([2,nil,3,nil,4,nil,5,nil,6]).rootNode

binaryTreePaths(node1)
binaryTreePaths(node2)
binaryTreePaths(node3)
binaryTreePaths(node4)
