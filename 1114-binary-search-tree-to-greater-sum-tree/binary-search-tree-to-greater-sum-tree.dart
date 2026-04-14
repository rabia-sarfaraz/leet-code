class Solution {
  int runningSum = 0;

  TreeNode? bstToGst(TreeNode? root) {
    dfs(root);
    return root;
  }

  void dfs(TreeNode? node) {
    if (node == null) return;

    // go right first (greater values)
    dfs(node.right);

    // update current node
    runningSum += node.val;
    node.val = runningSum;

    // go left
    dfs(node.left);
  }
}