class CBTInserter {
  TreeNode root;
  List<TreeNode> q = [];

  CBTInserter(TreeNode? root) : root = root! {
    List<TreeNode> bfs = [this.root];

    int i = 0;
    while (i < bfs.length) {
      TreeNode node = bfs[i++];

      if (node.left != null) bfs.add(node.left!);
      if (node.right != null) bfs.add(node.right!);
    }

    for (var node in bfs) {
      if (node.left == null || node.right == null) {
        q.add(node);
      }
    }
  }

  int insert(int val) {
    TreeNode newNode = TreeNode(val);

    TreeNode parent = q.first;

    if (parent.left == null) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
      q.removeAt(0);
    }

    q.add(newNode);

    return parent.val;
  }

  TreeNode? get_root() {
    return root;
  }
}