class Solution {
  TreeNode? recoverFromPreorder(String traversal) {
    List<TreeNode> stack = [];
    int i = 0;
    int n = traversal.length;

    while (i < n) {
      int depth = 0;

      // count dashes
      while (i < n && traversal[i] == '-') {
        depth++;
        i++;
      }

      // parse number
      int value = 0;
      while (i < n && isDigit(traversal[i])) {
        value = value * 10 + (traversal.codeUnitAt(i) - '0'.codeUnitAt(0));
        i++;
      }

      TreeNode node = TreeNode(value);

      // adjust stack to correct depth
      while (stack.length > depth) {
        stack.removeLast();
      }

      // attach node
      if (stack.isNotEmpty) {
        if (stack.last.left == null) {
          stack.last.left = node;
        } else {
          stack.last.right = node;
        }
      }

      stack.add(node);
    }

    return stack.isNotEmpty ? stack[0] : null;
  }

  bool isDigit(String ch) {
    return ch.codeUnitAt(0) >= '0'.codeUnitAt(0) &&
           ch.codeUnitAt(0) <= '9'.codeUnitAt(0);
  }
}