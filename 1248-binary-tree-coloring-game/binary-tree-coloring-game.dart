class Solution {
  int left = 0;
  int right = 0;

  int dfs(TreeNode? root, int x) {
    if (root == null) return 0;

    int l = dfs(root.left, x);
    int r = dfs(root.right, x);

    if (root.val == x) {
      left = l;
      right = r;
    }

    return l + r + 1;
  }

  bool btreeGameWinningMove(TreeNode? root, int n, int x) {
    dfs(root, x);

    int parent = n - (left + right + 1);

    int maxPart = left > right
        ? (left > parent ? left : parent)
        : (right > parent ? right : parent);

    return maxPart > n ~/ 2;
  }
}