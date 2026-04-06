class Solution {
  int pathSum(TreeNode? root, int targetSum) {
    Map<int, int> prefixCount = {0: 1};
    return dfs(root, 0, targetSum, prefixCount);
  }

  int dfs(TreeNode? node, int currSum, int target, Map<int, int> map) {
    if (node == null) return 0;

    currSum += node.val;

    int res = map[currSum - target] ?? 0;

    map[currSum] = (map[currSum] ?? 0) + 1;

    res += dfs(node.left, currSum, target, map);
    res += dfs(node.right, currSum, target, map);

    map[currSum] = map[currSum]! - 1;

    return res;
  }
}