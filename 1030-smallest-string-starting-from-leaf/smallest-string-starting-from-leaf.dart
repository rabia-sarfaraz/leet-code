class Solution {
  String smallestFromLeaf(TreeNode? root) {
    String best = "";

    void dfs(TreeNode? node, String path) {
      if (node == null) return;

      // convert node value to char
      String ch = String.fromCharCode('a'.codeUnitAt(0) + node.val);
      String newPath = ch + path; // prepend (leaf -> root)

      // if leaf node
      if (node.left == null && node.right == null) {
        if (best == "" || newPath.compareTo(best) < 0) {
          best = newPath;
        }
        return;
      }

      dfs(node.left, newPath);
      dfs(node.right, newPath);
    }

    dfs(root, "");
    return best;
  }
}