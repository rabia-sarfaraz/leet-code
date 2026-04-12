class Solution {
  int minCameraCover(TreeNode? root) {
    int cameras = 0;

    int dfs(TreeNode? node) {
      if (node == null) return 2; // null is covered

      int left = dfs(node.left);
      int right = dfs(node.right);

      // if any child needs camera → place camera here
      if (left == 0 || right == 0) {
        cameras++;
        return 1;
      }

      // if any child has camera → this node is covered
      if (left == 1 || right == 1) {
        return 2;
      }

      // else needs camera
      return 0;
    }

    if (dfs(root) == 0) {
      cameras++;
    }

    return cameras;
  }
}