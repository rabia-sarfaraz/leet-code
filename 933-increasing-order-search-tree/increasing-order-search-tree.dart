class Solution {
  TreeNode? increasingBST(TreeNode? root) {
    List<TreeNode> nodes = [];

    void inorder(TreeNode? node) {
      if (node == null) return;

      inorder(node.left);
      nodes.add(node);
      inorder(node.right);
    }

    inorder(root);

    for (int i = 0; i < nodes.length; i++) {
      nodes[i].left = null;
      nodes[i].right = (i + 1 < nodes.length) ? nodes[i + 1] : null;
    }

    return nodes.isNotEmpty ? nodes[0] : null;
  }
}