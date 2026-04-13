class Solution {
  int moves = 0;

  int distributeCoins(TreeNode? root) {
    dfs(root);
    return moves;
  }

  int dfs(TreeNode? node) {
    if (node == null) return 0;

    int left = dfs(node.left);
    int right = dfs(node.right);

    // count moves
    moves += left.abs() + right.abs();

    // return balance
    return node.val + left + right - 1;
  }
}