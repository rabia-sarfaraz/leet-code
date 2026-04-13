class Solution {
  int i = 0;

  TreeNode? bstFromPreorder(List<int> preorder) {
    return build(preorder, -1000000000, 1000000000);
  }

  TreeNode? build(List<int> preorder, int min, int max) {
    if (i >= preorder.length) return null;

    int val = preorder[i];

    if (val < min || val > max) return null;

    i++;

    TreeNode root = TreeNode(val);

    root.left = build(preorder, min, val);
    root.right = build(preorder, val, max);

    return root;
  }
}