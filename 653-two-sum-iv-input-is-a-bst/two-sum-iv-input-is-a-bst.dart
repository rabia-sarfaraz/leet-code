class Solution {
  bool findTarget(TreeNode? root, int k) {
    Set<int> seen = {};

    bool dfs(TreeNode? node) {
      if (node == null) return false;

      if (seen.contains(k - node.val)) return true;

      seen.add(node.val);

      return dfs(node.left) || dfs(node.right);
    }

    return dfs(root);
  }
}