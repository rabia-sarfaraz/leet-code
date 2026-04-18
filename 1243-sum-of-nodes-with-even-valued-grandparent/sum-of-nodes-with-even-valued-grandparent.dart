class Solution {
  int sumEvenGrandparent(TreeNode? root) {
    int ans = 0;

    void dfs(TreeNode? node, TreeNode? parent, TreeNode? grandparent) {
      if (node == null) return;

      if (grandparent != null && grandparent.val % 2 == 0) {
        ans += node.val;
      }

      dfs(node.left, node, parent);
      dfs(node.right, node, parent);
    }

    dfs(root, null, null);
    return ans;
  }
}