class Solution {
  int maxDiameter = 0;

  int diameterOfBinaryTree(TreeNode? root) {
    depth(TreeNode? node) {
      if (node == null) return 0;

      int left = depth(node.left);
      int right = depth(node.right);

      maxDiameter = maxDiameter > (left + right)
          ? maxDiameter
          : (left + right);

      return (left > right ? left : right) + 1;
    }

    depth(root);
    return maxDiameter;
  }
}