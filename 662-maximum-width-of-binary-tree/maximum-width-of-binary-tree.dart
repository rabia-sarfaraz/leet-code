import 'dart:collection';

class Solution {
  int widthOfBinaryTree(TreeNode? root) {
    if (root == null) return 0;

    int maxWidth = 0;

    Queue<List<dynamic>> q = Queue();
    q.add([root, 0]);

    while (q.isNotEmpty) {
      int size = q.length;
      int minIndex = q.first[1];
      int first = 0, last = 0;

      for (int i = 0; i < size; i++) {
        var cur = q.removeFirst();
        TreeNode node = cur[0];
        int idx = cur[1] - minIndex;

        if (i == 0) first = idx;
        if (i == size - 1) last = idx;

        if (node.left != null) {
          q.add([node.left, 2 * idx]);
        }
        if (node.right != null) {
          q.add([node.right, 2 * idx + 1]);
        }
      }

      maxWidth = maxWidth > (last - first + 1)
          ? maxWidth
          : (last - first + 1);
    }

    return maxWidth;
  }
}