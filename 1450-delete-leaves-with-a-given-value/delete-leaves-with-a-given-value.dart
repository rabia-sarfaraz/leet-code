class Solution {
  TreeNode? removeLeafNodes(TreeNode? root, int target) {
    if (root == null) return null;

    // Process left and right first (post-order)
    root.left = removeLeafNodes(root.left, target);
    root.right = removeLeafNodes(root.right, target);

    // If current node is now a leaf and equals target → delete it
    if (root.left == null && root.right == null && root.val == target) {
      return null;
    }

    return root;
  }
}