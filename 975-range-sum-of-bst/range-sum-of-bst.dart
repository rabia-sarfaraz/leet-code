class Solution {
  int rangeSumBST(TreeNode? root, int low, int high) {
    if (root == null) return 0;

    // If node is smaller than low, ignore left subtree
    if (root.val < low) {
      return rangeSumBST(root.right, low, high);
    }

    // If node is greater than high, ignore right subtree
    if (root.val > high) {
      return rangeSumBST(root.left, low, high);
    }

    // Node is in range
    return root.val +
        rangeSumBST(root.left, low, high) +
        rangeSumBST(root.right, low, high);
  }
}