
class Solution {
  List<int> findSubtreeSizes(List<int> parent, String s) {
    int n = parent.length;

    List<List<int>> children = List.generate(
      n,
      (_) => <int>[],
    );

    for (int i = 1; i < n; i++) {
      children[parent[i]].add(i);
    }

    List<int> newParent = List.filled(n, -1);
    List<int> last = List.filled(26, -1);

    List<int> stackNode = [0];
    List<int> stackState = [0];
    List<int> stackPrev = [-1];

    // Find nearest ancestor with the same character
    while (stackNode.isNotEmpty) {
      int node = stackNode.removeLast();
      int state = stackState.removeLast();
      int prev = stackPrev.removeLast();

      int ch = s.codeUnitAt(node) - 97;

      if (state == 1) {
        last[ch] = prev;
        continue;
      }

      int previous = last[ch];

      newParent[node] = node == 0
          ? -1
          : (previous == -1 ? parent[node] : previous);

      last[ch] = node;

      stackNode.add(node);
      stackState.add(1);
      stackPrev.add(previous);

      for (int i = children[node].length - 1; i >= 0; i--) {
        stackNode.add(children[node][i]);
        stackState.add(0);
        stackPrev.add(-1);
      }
    }

    // Build the updated tree
    List<List<int>> newChildren = List.generate(
      n,
      (_) => <int>[],
    );

    for (int i = 1; i < n; i++) {
      newChildren[newParent[i]].add(i);
    }

    // Calculate subtree sizes
    List<int> order = [];
    List<int> stack = [0];

    while (stack.isNotEmpty) {
      int node = stack.removeLast();
      order.add(node);

      for (int child in newChildren[node]) {
        stack.add(child);
      }
    }

    List<int> ans = List.filled(n, 1);

    for (int i = order.length - 1; i > 0; i--) {
      int node = order[i];
      ans[newParent[node]] += ans[node];
    }

    return ans;
  }
}
