class Solution {
  TreeNode? subtreeWithAllDeepest(TreeNode? root) {
    return dfs(root).node;
  }

  Result dfs(TreeNode? node) {
    if (node == null) {
      return Result(null, 0);
    }

    Result left = dfs(node.left);
    Result right = dfs(node.right);

    if (left.depth > right.depth) {
      return Result(left.node, left.depth + 1);
    } else if (right.depth > left.depth) {
      return Result(right.node, right.depth + 1);
    } else {
      return Result(node, left.depth + 1);
    }
  }
}

class Result {
  TreeNode? node;
  int depth;

  Result(this.node, this.depth);
}