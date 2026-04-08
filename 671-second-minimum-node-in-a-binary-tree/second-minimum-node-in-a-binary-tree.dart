class Solution {
  int findSecondMinimumValue(TreeNode? root) {
    if (root == null) return -1;

    int minVal = root.val;
    int ans = -1;

    void dfs(TreeNode? node) {
      if (node == null) return;

      if (node.val > minVal) {
        if (ans == -1 || node.val < ans) {
          ans = node.val;
        }
      } else {
        dfs(node.left);
        dfs(node.right);
      }
    }

    dfs(root);
    return ans;
  }
}