/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  bool flipEquiv(TreeNode? root1, TreeNode? root2) {
    // base cases
    if (root1 == null && root2 == null) return true;
    if (root1 == null || root2 == null) return false;
    if (root1.val != root2.val) return false;

    // no flip
    bool noFlip = flipEquiv(root1.left, root2.left) &&
                  flipEquiv(root1.right, root2.right);

    // flip
    bool flip = flipEquiv(root1.left, root2.right) &&
                flipEquiv(root1.right, root2.left);

    return noFlip || flip;
  }
}