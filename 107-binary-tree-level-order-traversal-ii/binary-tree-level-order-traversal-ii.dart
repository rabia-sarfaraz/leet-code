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
  List<List<int>> levelOrderBottom(TreeNode? root) {
    if (root == null) return [];

    List<List<int>> result = [];
    Queue<TreeNode> queue = Queue<TreeNode>();
    
    queue.add(root);

    while (queue.isNotEmpty) {
      int size = queue.length;
      List<int> level = [];

      for (int i = 0; i < size; i++) {
        TreeNode node = queue.removeFirst();
        level.add(node.val);

        if (node.left != null) {
          queue.add(node.left!);
        }
        if (node.right != null) {
          queue.add(node.right!);
        }
      }

      result.add(level);
    }

    // reverse for bottom-up
    return result.reversed.toList();
  }
}