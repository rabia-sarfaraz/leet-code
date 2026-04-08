import 'dart:math';

class Solution {
  List<List<String>> printTree(TreeNode? root) {
    int h = height(root);
    int rows = h;
    int cols = (1 << h) - 1;

    List<List<String>> res =
        List.generate(rows, (_) => List.filled(cols, ""));

    void dfs(TreeNode? node, int r, int l, int rgt) {
      if (node == null) return;

      int mid = (l + rgt) ~/ 2;
      res[r][mid] = node.val.toString();

      dfs(node.left, r + 1, l, mid - 1);
      dfs(node.right, r + 1, mid + 1, rgt);
    }

    dfs(root, 0, 0, cols - 1);

    return res;
  }

  int height(TreeNode? root) {
    if (root == null) return 0;
    return 1 + max(height(root.left), height(root.right));
  }
}