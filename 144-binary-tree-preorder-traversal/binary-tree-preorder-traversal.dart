class Solution {
  List<int> preorderTraversal(TreeNode? root) {
    List<int> result = [];

    void dfs(TreeNode? node) {
      if (node == null) return;

      result.add(node.val);   // Root
      dfs(node.left);         // Left
      dfs(node.right);        // Right
    }

    dfs(root);
    return result;
  }
}