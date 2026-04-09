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
  int minDiffInBST(TreeNode? root) {
    int? prev;
    int ans = 1 << 30;

    void inorder(TreeNode? node) {
      if (node == null) return;

      inorder(node.left);

      if (prev != null) {
        ans = ans < (node.val - prev!) ? ans : (node.val - prev!);
      }
      prev = node.val;

      inorder(node.right);
    }

    inorder(root);
    return ans;
  }
}