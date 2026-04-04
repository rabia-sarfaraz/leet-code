class Solution {
  List<String> binaryTreePaths(TreeNode? root) {
    List<String> result = [];
    if (root == null) return result;

    void dfs(TreeNode node, String path) {
      // Leaf node
      if (node.left == null && node.right == null) {
        result.add(path);
        return;
      }

      if (node.left != null) {
        dfs(node.left!, path + "->" + node.left!.val.toString());
      }

      if (node.right != null) {
        dfs(node.right!, path + "->" + node.right!.val.toString());
      }
    }

    dfs(root, root.val.toString());
    return result;
  }
}