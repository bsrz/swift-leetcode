class TreeNode: CustomStringConvertible {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    var description: String {
        "value: \(val), left: \(left?.description ?? "nil"), right: \(right?.description ?? "nil")"
    }

    init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }

    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }

    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class RecoverTreeFromPreorderTraversal {
    func recoverFromPreorder(_ traversal: String) -> TreeNode? {
        recoverFromPreorder0(traversal)
    }

    func recoverFromPreorder0(_ traversal: String) -> TreeNode? {
        fatalError()
    }
}
