class BSTIterator {
  List<TreeNode> stack = [];

  BSTIterator(TreeNode? root) {
    _pushLeft(root);
  }

  void _pushLeft(TreeNode? node) {
    while (node != null) {
      stack.add(node);
      node = node.left;
    }
  }

  int next() {
    TreeNode node = stack.removeLast();
    if (node.right != null) {
      _pushLeft(node.right);
    }
    return node.val;
  }

  bool hasNext() {
    return stack.isNotEmpty;
  }
}