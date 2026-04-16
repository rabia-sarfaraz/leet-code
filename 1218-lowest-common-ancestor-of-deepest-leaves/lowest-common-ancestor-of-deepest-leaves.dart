class Solution {
  TreeNode? lcaDeepestLeaves(TreeNode? root) {
    return dfs(root).node;
  }

  Pair dfs(TreeNode? root) {
    if (root == null) {
      return Pair(null, 0);
    }

    var left = dfs(root.left);
    var right = dfs(root.right);

    if (left.depth > right.depth) {
      return Pair(left.node, left.depth + 1);
    } else if (right.depth > left.depth) {
      return Pair(right.node, right.depth + 1);
    } else {
      return Pair(root, left.depth + 1);
    }
  }
}

class Pair {
  TreeNode? node;
  int depth;

  Pair(this.node, this.depth);
}