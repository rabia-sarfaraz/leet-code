/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */

import 'dart:collection';

class Solution {
  bool isEvenOddTree(TreeNode? root) {
    Queue<TreeNode> queue = Queue<TreeNode>();
    queue.add(root!);

    int level = 0;

    while (queue.isNotEmpty) {
      int size = queue.length;
      int prev = level % 2 == 0 ? -1 : 1000001;

      for (int i = 0; i < size; i++) {
        TreeNode node = queue.removeFirst();

        if (level % 2 == 0) {
          // Even level: odd values, strictly increasing
          if (node.val % 2 == 0 || node.val <= prev) return false;
        } else {
          // Odd level: even values, strictly decreasing
          if (node.val % 2 == 1 || node.val >= prev) return false;
        }

        prev = node.val;

        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }

      level++;
    }

    return true;
  }
}