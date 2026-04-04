class Solution {
  List<int> postorderTraversal(TreeNode? root) {
    List<int> result = [];

    void dfs(TreeNode? node) {
      if (node == null) return;

      dfs(node.left);      // Left
      dfs(node.right);     // Right
      result.add(node.val); // Root
    }

    dfs(root);
    return result;
  }
}