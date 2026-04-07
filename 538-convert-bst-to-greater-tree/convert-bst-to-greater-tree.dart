class Solution {
  int sum = 0;

  TreeNode? convertBST(TreeNode? root) {
    void dfs(TreeNode? node) {
      if (node == null) return;

      dfs(node.right);

      sum += node.val;
      node.val = sum;

      dfs(node.left);
    }

    dfs(root);
    return root;
  }
}