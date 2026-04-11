class Solution {
  Map<int, List<TreeNode?>> memo = {};

  List<TreeNode?> allPossibleFBT(int n) {
    if (memo.containsKey(n)) return memo[n]!;

    List<TreeNode?> res = [];

    if (n == 1) {
      res.add(TreeNode(0));
      return res;
    }

    if (n % 2 == 0) return [];

    for (int left = 1; left < n; left += 2) {
      int right = n - 1 - left;

      List<TreeNode?> leftTrees = allPossibleFBT(left);
      List<TreeNode?> rightTrees = allPossibleFBT(right);

      for (var l in leftTrees) {
        for (var r in rightTrees) {
          TreeNode root = TreeNode(0);
          root.left = l;
          root.right = r;
          res.add(root);
        }
      }
    }

    memo[n] = res;
    return res;
  }
}