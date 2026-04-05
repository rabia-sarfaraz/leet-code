class Solution {
  int rob(TreeNode? root) {
    List<int> res = dfs(root);
    return res[0] > res[1] ? res[0] : res[1];
  }

  List<int> dfs(TreeNode? node) {
    if (node == null) return [0, 0];

    List<int> left = dfs(node.left);
    List<int> right = dfs(node.right);

    int rob = node.val + left[1] + right[1];
    int notRob = (left[0] > left[1] ? left[0] : left[1]) +
                 (right[0] > right[1] ? right[0] : right[1]);

    return [rob, notRob];
  }
}