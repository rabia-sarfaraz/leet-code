class Solution {
  int ans = 0;

  int longestUnivaluePath(TreeNode? root) {
    dfs(root);
    return ans;
  }

  int dfs(TreeNode? node) {
    if (node == null) return 0;

    int left = dfs(node.left);
    int right = dfs(node.right);

    int leftPath = 0;
    int rightPath = 0;

    if (node.left != null && node.left!.val == node.val) {
      leftPath = left + 1;
    }

    if (node.right != null && node.right!.val == node.val) {
      rightPath = right + 1;
    }

    ans = ans > (leftPath + rightPath) ? ans : (leftPath + rightPath);

    return leftPath > rightPath ? leftPath : rightPath;
  }
}