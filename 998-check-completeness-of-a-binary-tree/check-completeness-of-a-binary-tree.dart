import 'dart:collection';

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
  bool isCompleteTree(TreeNode? root) {
    if (root == null) return true;

    Queue<TreeNode?> q = Queue();
    q.add(root);

    bool seenNull = false;

    while (q.isNotEmpty) {
      TreeNode? node = q.removeFirst();

      if (node == null) {
        seenNull = true;
      } else {
        if (seenNull) return false;

        q.add(node.left);
        q.add(node.right);
      }
    }

    return true;
  }
}