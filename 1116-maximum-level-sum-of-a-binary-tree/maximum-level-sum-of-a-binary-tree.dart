class Solution {
  int maxLevelSum(TreeNode? root) {
    if (root == null) return 0;

    List<TreeNode> queue = [root];
    int level = 1;

    int maxSum = root.val;
    int resultLevel = 1;

    while (queue.isNotEmpty) {
      int size = queue.length;
      int sum = 0;

      for (int i = 0; i < size; i++) {
        TreeNode node = queue.removeAt(0);
        sum += node.val;

        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }

      if (sum > maxSum) {
        maxSum = sum;
        resultLevel = level;
      }

      level++;
    }

    return resultLevel;
  }
}