class Solution {
  int? prev;
  int count = 0;
  int maxCount = 0;
  List<int> result = [];

  List<int> findMode(TreeNode? root) {
    inorder(root);
    return result;
  }

  void inorder(TreeNode? node) {
    if (node == null) return;

    inorder(node.left);

    // Process current node
    if (prev == node.val) {
      count++;
    } else {
      count = 1;
    }

    if (count > maxCount) {
      maxCount = count;
      result = [node.val];
    } else if (count == maxCount) {
      result.add(node.val);
    }

    prev = node.val;

    inorder(node.right);
  }
}