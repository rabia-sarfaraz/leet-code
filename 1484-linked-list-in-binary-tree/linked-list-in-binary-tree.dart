class Solution {
  bool isSubPath(ListNode? head, TreeNode? root) {
    if (root == null) return false;

    return _match(head, root) ||
        isSubPath(head, root.left) ||
        isSubPath(head, root.right);
  }

  bool _match(ListNode? head, TreeNode? node) {
    if (head == null) return true;
    if (node == null) return false;

    if (head.val != node.val) return false;

    return _match(head.next, node.left) ||
        _match(head.next, node.right);
  }
}