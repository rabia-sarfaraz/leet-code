class Solution {
  int preIndex = 0;
  int postIndex = 0;

  TreeNode? constructFromPrePost(List<int> preorder, List<int> postorder) {
    return build(preorder, postorder);
  }

  TreeNode? build(List<int> pre, List<int> post) {
    TreeNode node = TreeNode(pre[preIndex++]);

    if (node.val != post[postIndex]) {
      node.left = build(pre, post);
    }

    if (node.val != post[postIndex]) {
      node.right = build(pre, post);
    }

    postIndex++;

    return node;
  }
}