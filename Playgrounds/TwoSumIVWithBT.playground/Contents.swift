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

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {

    var values = [Int]()
    var counter = 0
    var nodeStack = [TreeNode]()
    var root = root

        while root != nil || !nodeStack.isEmpty {

            if let tempRoot = root {
                nodeStack.append(tempRoot)
                root = tempRoot.left
            } else {
                root = nodeStack.popLast()
                let value = root!.val
                print(values)
                values.forEach({
                    if($0 + value == k) {
                        counter += 1
                    }
                })
                values.append(value)
                root = root!.right
            }
        }

    return counter >= 1
}

let node0 = RootNode([5,3,6,2,4,nil,7]).rootNode
let node1 = RootNode([2,1,3]).rootNode
findTarget(node0, 9)
findTarget(node1, 4)

/*
 INORDER TRAVERSE

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
 */
