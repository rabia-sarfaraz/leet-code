class Solution {
  List<int> rightSideView(TreeNode? root) {
    if (root == null) return [];

    List<int> result = [];
    List<TreeNode> queue = [root];

    while (queue.isNotEmpty) {
      int size = queue.length;

      for (int i = 0; i < size; i++) {
        TreeNode node = queue.removeAt(0);

        // last node of level = right side view
        if (i == size - 1) {
          result.add(node.val);
        }

        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }
    }

    return result;
  }
}