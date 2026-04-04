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
  int getLeftHeight(TreeNode? node) {
    int h = 0;
    while (node != null) {
      h++;
      node = node.left;
    }
    return h;
  }

  int getRightHeight(TreeNode? node) {
    int h = 0;
    while (node != null) {
      h++;
      node = node.right;
    }
    return h;
  }

  int countNodes(TreeNode? root) {
    if (root == null) return 0;

    int leftH = getLeftHeight(root);
    int rightH = getRightHeight(root);

    if (leftH == rightH) {
      return (1 << leftH) - 1; // perfect binary tree
    }

    return 1 + countNodes(root.left) + countNodes(root.right);
  }
}