class Solution {
  bool isSymmetric(TreeNode? root) {
    if (root == null) return true;
    return _isMirror(root.left, root.right);
  }

  bool _isMirror(TreeNode? left, TreeNode? right) {
    if (left == null && right == null) return true;
    if (left == null || right == null) return false;
    if (left.val != right.val) return false;

    return _isMirror(left.left, right.right) &&
           _isMirror(left.right, right.left);
  }
}