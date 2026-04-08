import 'dart:collection';

class Solution {
  List<double> averageOfLevels(TreeNode? root) {
    if (root == null) return [];

    List<double> result = [];
    Queue<TreeNode> queue = Queue();
    queue.add(root);

    while (queue.isNotEmpty) {
      int size = queue.length;
      double sum = 0;

      for (int i = 0; i < size; i++) {
        TreeNode node = queue.removeFirst();
        sum += node.val;

        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }

      result.add(sum / size);
    }

    return result;
  }
}