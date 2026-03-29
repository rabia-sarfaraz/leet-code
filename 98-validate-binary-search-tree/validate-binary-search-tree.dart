class Solution {
  bool isValidBST(TreeNode? root) {
    return _validate(root, null, null);
  }

  bool _validate(TreeNode? node, int? min, int? max) {
    if (node == null) return true;

    // current node invalid ho to false
    if (min != null && node.val <= min) return false;
    if (max != null && node.val >= max) return false;

    // left and right subtree check
    return _validate(node.left, min, node.val) &&
           _validate(node.right, node.val, max);
  }
}