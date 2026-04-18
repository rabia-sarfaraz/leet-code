class FindElements {
  Set<int> values = {};

  FindElements(TreeNode? root) {
    _dfs(root, 0);
  }

  void _dfs(TreeNode? node, int val) {
    if (node == null) return;

    node.val = val;
    values.add(val);

    _dfs(node.left, 2 * val + 1);
    _dfs(node.right, 2 * val + 2);
  }

  bool find(int target) {
    return values.contains(target);
  }
}