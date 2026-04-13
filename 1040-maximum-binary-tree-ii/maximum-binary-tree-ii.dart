class Solution {
  TreeNode? insertIntoMaxTree(TreeNode? root, int val) {
    if (root == null) return TreeNode(val);

    if (val > root.val) {
      TreeNode newRoot = TreeNode(val);
      newRoot.left = root;
      return newRoot;
    }

    root.right = insertIntoMaxTree(root.right, val);
    return root;
  }
}