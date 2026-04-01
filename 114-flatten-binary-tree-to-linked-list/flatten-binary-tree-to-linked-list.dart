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
  TreeNode? prev;

  void flatten(TreeNode? root) {
    if (root == null) return;

    flatten(root.right);
    flatten(root.left);

    root.right = prev;
    root.left = null;

    prev = root;
  }
}