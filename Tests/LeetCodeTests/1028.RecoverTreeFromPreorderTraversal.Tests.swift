@testable import LeetCode
import Testing
import TestingPerformance

@Suite(.timed(), .serialized)
struct RecoverTreeFromPreorderTraversalTests {
    @Test func example1() {
        let sut = RecoverTreeFromPreorderTraversal()
        let output = sut.recoverFromPreorder("1-2--3--4-5--6--7")
        #expect(levelOrder(output) == [1, 2, 5, 3, 4, 6, 7])
    }

    @Test func example2() {
        let sut = RecoverTreeFromPreorderTraversal()
        let output = sut.recoverFromPreorder("1-2--3---4-5--6---7")
        #expect(levelOrder(output) == [1, 2, 5, 3, nil, 6, nil, 4, nil, 7])
    }

    @Test func example3() {
        let sut = RecoverTreeFromPreorderTraversal()
        let output = sut.recoverFromPreorder("1-401--349---90--88")
        #expect(levelOrder(output) == [1, 401, nil, 349, 88, 90])
    }
}

/// Serializes a tree into LeetCode's level-order format, using `nil` for
/// missing children and trimming trailing `nil`s.
private func levelOrder(_ root: TreeNode?) -> [Int?] {
    var result: [Int?] = []
    var queue: [TreeNode?] = [root]
    var index = 0
    while index < queue.count {
        let node = queue[index]
        index += 1
        if let node {
            result.append(node.val)
            queue.append(node.left)
            queue.append(node.right)
        } else {
            result.append(nil)
        }
    }
    while let last = result.last, last == nil {
        result.removeLast()
    }
    return result
}
