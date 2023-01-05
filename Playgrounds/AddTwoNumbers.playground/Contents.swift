import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

    let resultNode = sumNodes(node1: l1, node2: l2, rest: 0)

    return resultNode
}

func sumNodes(node1: ListNode?, node2: ListNode?, rest: Int) -> ListNode? {

    if node1 == nil && node2 == nil && rest == 0 {
        return nil
    } else if node1 == nil && node2 == nil && rest == 1 {
        return ListNode(1)
    }
    var rest = rest
    var sum = (node1?.val ?? 0) + (node2?.val ?? 0) +  rest


    if sum >= 10 {
        sum -= 10
        rest = 1
    } else {
        rest = 0
    }

    let newNode = ListNode(sum)
    newNode.next = sumNodes(node1: node1?.next, node2: node2?.next, rest: rest)
    return newNode
}

func createHead(nums: [Int]) -> ListNode? {
    if nums.isEmpty {
        return nil
    }

    var head = ListNode(nums[nums.count - 1])

    for index in Array(nums.reversed()).indices {

        if index > 0 {

            let tempNode = ListNode(Array(nums.reversed())[index])
            tempNode.next = head
            head = tempNode
        }
    }

    return head
}

let node1 = createHead(nums: [2,4,3])
let node2 = createHead(nums: [5,6,4])

addTwoNumbers(node1, node2)

let node11 = createHead(nums: [9,9,9,9,9,9,9])
let node21 = createHead(nums: [9,9,9,9])

addTwoNumbers(node11, node21)

let node13 = createHead(nums: [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
let node23 = createHead(nums: [5,6,4])

addTwoNumbers(node13, node23)
