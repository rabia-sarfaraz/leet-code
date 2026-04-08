class Solution {
  List<TreeNode?> findDuplicateSubtrees(TreeNode? root) {
    Map<String, int> map = {};
    List<TreeNode?> result = [];

    String dfs(TreeNode? node) {
      if (node == null) return "#";

      String left = dfs(node.left);
      String right = dfs(node.right);

      String serial = "$left,$right,${node.val}";

      map[serial] = (map[serial] ?? 0) + 1;

      if (map[serial] == 2) {
        result.add(node);
      }

      return serial;
    }

    dfs(root);
    return result;
  }
}