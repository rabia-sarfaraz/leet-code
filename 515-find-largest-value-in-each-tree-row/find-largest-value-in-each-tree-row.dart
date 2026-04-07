class Solution {
  List<int> largestValues(TreeNode? root) {
    if (root == null) return [];

    List<TreeNode> queue = [];
    queue.add(root);

    List<int> result = [];

    while (queue.isNotEmpty) {
      int size = queue.length;
      int maxVal = -2147483648;

      for (int i = 0; i < size; i++) {
        TreeNode node = queue.removeAt(0);

        if (node.val > maxVal) {
          maxVal = node.val;
        }

        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }

      result.add(maxVal);
    }

    return result;
  }
}