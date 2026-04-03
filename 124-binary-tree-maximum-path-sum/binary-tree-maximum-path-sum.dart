class Solution {
  int maxSum = -1000000000;

  int maxPathSum(TreeNode? root) {
    dfs(root);
    return maxSum;
  }

  int dfs(TreeNode? node) {
    if (node == null) return 0;

    int left = dfs(node.left);
    int right = dfs(node.right);

    // ignore negative paths
    left = left > 0 ? left : 0;
    right = right > 0 ? right : 0;

    // update global max
    int current = node.val + left + right;
    if (current > maxSum) {
      maxSum = current;
    }

    // return one side path
    return node.val + (left > right ? left : right);
  }
}