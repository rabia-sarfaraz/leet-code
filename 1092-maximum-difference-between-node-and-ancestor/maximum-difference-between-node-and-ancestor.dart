import 'dart:math';

class Solution {
  int maxAncestorDiff(TreeNode? root) {
    return dfs(root, root!.val, root.val);
  }

  int dfs(TreeNode? node, int currMin, int currMax) {
    if (node == null) return currMax - currMin;

    currMin = min(currMin, node.val);
    currMax = max(currMax, node.val);

    int left = dfs(node.left, currMin, currMax);
    int right = dfs(node.right, currMin, currMax);

    return max(left, right);
  }
}