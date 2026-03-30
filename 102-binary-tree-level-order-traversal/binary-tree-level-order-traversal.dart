class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    List<List<int>> result = [];
    if (root == null) return result;

    List<TreeNode> queue = [root];

    while (queue.isNotEmpty) {
      int size = queue.length;
      List<int> level = [];

      for (int i = 0; i < size; i++) {
        TreeNode node = queue.removeAt(0);
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

    return result;
  }
}