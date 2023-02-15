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

struct Node: Equatable {

    let val: Int
    let parent: TreeNode?
    let depth: Int

    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.parent?.val != rhs.parent?.val && lhs.depth == rhs.depth
    }
}

func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {

    let targetOne = traverseBT(nil, root, x, 0)
    let targetTwo = traverseBT(nil, root, y, 0)

    return targetOne == targetTwo
}

func traverseBT(_ parent: TreeNode?, _ node: TreeNode?, _ val: Int, _ depth: Int) -> Node? {

    var targetNode: Node? = nil
    var left: Node? = nil
    var right: Node? = nil

    guard let node = node else { return nil }
    if node.val == val {
        targetNode = Node(val: val, parent: parent, depth: depth)
    } else {
        left = traverseBT(node, node.left, val, depth + 1)
        right = traverseBT(node, node.right, val, depth + 1)
    }

    if left?.val == val {
        return left
    }

    if right?.val == val {
        return right
    }

    return targetNode
}

let node1 = RootNode([1,2,3,4]).rootNode
let node2 = RootNode([1,2,3,nil,4,nil,5]).rootNode

isCousins(node1, 4, 3)
isCousins(node2, 5, 4)

