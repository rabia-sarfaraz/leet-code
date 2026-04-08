import 'dart:collection';

class Solution {
  TreeNode? addOneRow(TreeNode? root, int val, int depth) {
    if (depth == 1) {
      return TreeNode(val, root, null);
    }

    Queue<TreeNode?> q = Queue();
    q.add(root);

    int currentDepth = 1;

    while (q.isNotEmpty) {
      int size = q.length;

      if (currentDepth == depth - 1) {
        for (int i = 0; i < size; i++) {
          TreeNode? node = q.removeFirst();

          TreeNode? oldLeft = node!.left;
          TreeNode? oldRight = node.right;

          node.left = TreeNode(val);
          node.left!.left = oldLeft;

          node.right = TreeNode(val);
          node.right!.right = oldRight;
        }
        break;
      }

      for (int i = 0; i < size; i++) {
        TreeNode? node = q.removeFirst();

        if (node!.left != null) q.add(node.left);
        if (node.right != null) q.add(node.right);
      }

      currentDepth++;
    }

    return root;
  }
}