class Solution {
  TreeNode? sufficientSubset(TreeNode? root, int limit) {
    
    TreeNode? dfs(TreeNode? node, int sum) {
      if (node == null) return null;

      // leaf node
      if (node.left == null && node.right == null) {
        return (node.val >= sum) ? node : null;
      }

      node.left = dfs(node.left, sum - node.val);
      node.right = dfs(node.right, sum - node.val);

      if (node.left == null && node.right == null) {
        return null;
      }

      return node;
    }

    return dfs(root, limit);
  }
}