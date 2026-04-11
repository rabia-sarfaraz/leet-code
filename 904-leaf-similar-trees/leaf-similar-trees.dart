class Solution {
  bool leafSimilar(TreeNode? root1, TreeNode? root2) {
    List<int> leaves1 = [];
    List<int> leaves2 = [];

    void dfs(TreeNode? node, List<int> leaves) {
      if (node == null) return;

      if (node.left == null && node.right == null) {
        leaves.add(node.val);
        return;
      }

      dfs(node.left, leaves);
      dfs(node.right, leaves);
    }

    dfs(root1, leaves1);
    dfs(root2, leaves2);

    if (leaves1.length != leaves2.length) return false;

    for (int i = 0; i < leaves1.length; i++) {
      if (leaves1[i] != leaves2[i]) return false;
    }

    return true;
  }
}