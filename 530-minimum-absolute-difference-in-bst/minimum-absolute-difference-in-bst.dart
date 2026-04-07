class Solution {
  int getMinimumDifference(TreeNode? root) {
    int? prev;
    int result = 1 << 30;

    void inorder(TreeNode? node) {
      if (node == null) return;

      inorder(node.left);

      if (prev != null) {
        int diff = (node.val - prev!).abs();
        result = result < diff ? result : diff;
      }
      prev = node.val;

      inorder(node.right);
    }

    inorder(root);
    return result;
  }
}