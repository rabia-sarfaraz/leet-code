class Solution {
  List<String> buildArray(List<int> target, int n) {
    List<String> ops = [];
    int j = 0;

    for (int i = 1; i <= n; i++) {
      if (j == target.length) break;

      ops.add("Push");

      if (i == target[j]) {
        j++;
      } else {
        ops.add("Pop");
      }
    }

    return ops;
  }
}