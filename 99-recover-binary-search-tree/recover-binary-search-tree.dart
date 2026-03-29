class Solution {
  TreeNode? first;
  TreeNode? second;
  TreeNode? prev;

  void recoverTree(TreeNode? root) {
    _inorder(root);

    // swap values
    int temp = first!.val;
    first!.val = second!.val;
    second!.val = temp;
  }

  void _inorder(TreeNode? node) {
    if (node == null) return;

    _inorder(node.left);

    // detect violation
    if (prev != null && prev!.val > node.val) {
      if (first == null) {
        first = prev;
      }
      second = node;
    }

    prev = node;

    _inorder(node.right);
  }
}