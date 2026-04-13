class Solution {
  bool isCousins(TreeNode? root, int x, int y) {
    int xDepth = -1, yDepth = -1;
    TreeNode? xParent, yParent;

    void dfs(TreeNode? node, TreeNode? parent, int depth) {
      if (node == null) return;

      if (node.val == x) {
        xDepth = depth;
        xParent = parent;
      } else if (node.val == y) {
        yDepth = depth;
        yParent = parent;
      }

      dfs(node.left, node, depth + 1);
      dfs(node.right, node, depth + 1);
    }

    dfs(root, null, 0);

    return (xDepth == yDepth) && (xParent != yParent);
  }
}