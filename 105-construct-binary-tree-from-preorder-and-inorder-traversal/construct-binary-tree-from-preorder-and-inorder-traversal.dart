class Solution {
  late Map<int, int> inorderMap;
  int preorderIndex = 0;

  TreeNode? buildTree(List<int> preorder, List<int> inorder) {
    inorderMap = {};
    
    for (int i = 0; i < inorder.length; i++) {
      inorderMap[inorder[i]] = i;
    }

    return _build(preorder, 0, inorder.length - 1);
  }

  TreeNode? _build(List<int> preorder, int left, int right) {
    if (left > right) return null;

    int rootVal = preorder[preorderIndex++];
    TreeNode root = TreeNode(rootVal);

    int index = inorderMap[rootVal]!;

    root.left = _build(preorder, left, index - 1);
    root.right = _build(preorder, index + 1, right);

    return root;
  }
}