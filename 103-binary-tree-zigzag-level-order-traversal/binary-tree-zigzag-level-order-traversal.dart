class Solution {
  List<List<int>> zigzagLevelOrder(TreeNode? root) {
    List<List<int>> result = [];
    if (root == null) return result;

    List<TreeNode> queue = [root];
    bool leftToRight = true;

    while (queue.isNotEmpty) {
      int size = queue.length;
      List<int> level = List.filled(size, 0);

      for (int i = 0; i < size; i++) {
        TreeNode node = queue.removeAt(0);

        int index = leftToRight ? i : size - 1 - i;
        level[index] = node.val;

        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }

      result.add(level);
      leftToRight = !leftToRight; // flip direction
    }

    return result;
  }
}