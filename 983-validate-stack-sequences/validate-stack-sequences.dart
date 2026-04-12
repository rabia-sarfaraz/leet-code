class Solution {
  bool validateStackSequences(List<int> pushed, List<int> popped) {
    List<int> stack = [];
    int j = 0;

    for (int x in pushed) {
      stack.add(x);

      while (stack.isNotEmpty && stack.last == popped[j]) {
        stack.removeLast();
        j++;
      }
    }

    return stack.isEmpty;
  }
}