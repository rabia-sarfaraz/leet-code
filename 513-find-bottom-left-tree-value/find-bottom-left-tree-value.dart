class Solution {
  int findBottomLeftValue(TreeNode? root) {
    if (root == null) return 0;

    List<TreeNode> queue = [];
    queue.add(root);

    int result = root.val;

    while (queue.isNotEmpty) {
      int size = queue.length;
      result = queue[0].val; // first node of current level

      for (int i = 0; i < size; i++) {
        TreeNode node = queue.removeAt(0);

        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }
    }

    return result;
  }
}