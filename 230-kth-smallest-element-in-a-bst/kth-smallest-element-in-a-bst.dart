class Solution {
  int _count = 0;
  int _result = 0;
  bool _found = false;

  int kthSmallest(TreeNode? root, int k) {
    _inorder(root, k);
    return _result;
  }

  void _inorder(TreeNode? node, int k) {
    if (node == null || _found) return;

    _inorder(node.left, k);

    if (_found) return;

    _count++;
    if (_count == k) {
      _result = node.val;
      _found = true;
      return;
    }

    _inorder(node.right, k);
  }
}