class Solution {
  List<List<int>> verticalTraversal(TreeNode? root) {
    if (root == null) return [];

    List<List<int>> nodes = [];

    void dfs(TreeNode? node, int row, int col) {
      if (node == null) return;

      nodes.add([col, row, node.val]);

      dfs(node.left, row + 1, col - 1);
      dfs(node.right, row + 1, col + 1);
    }

    dfs(root, 0, 0);

    // sort by col, row, value
    nodes.sort((a, b) {
      if (a[0] != b[0]) return a[0] - b[0];
      if (a[1] != b[1]) return a[1] - b[1];
      return a[2] - b[2];
    });

    List<List<int>> res = [];
    int? lastCol;

    for (var n in nodes) {
      int col = n[0], val = n[2];

      if (lastCol == null || col != lastCol) {
        res.add([val]);
        lastCol = col;
      } else {
        res.last.add(val);
      }
    }

    return res;
  }
}