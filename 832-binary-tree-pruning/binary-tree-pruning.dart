class Solution {
  TreeNode? pruneTree(TreeNode? root) {
    if (root == null) return null;

    root.left = pruneTree(root.left);
    root.right = pruneTree(root.right);

    // agar current node 0 hai aur dono sides null hain → remove it
    if (root.val == 0 && root.left == null && root.right == null) {
      return null;
    }

    return root;
  }
}