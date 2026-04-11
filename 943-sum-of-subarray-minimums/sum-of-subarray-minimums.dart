class Solution {
  int sumSubarrayMins(List<int> arr) {
    int n = arr.length;
    int mod = 1000000007;

    List<int> left = List.filled(n, 0);
    List<int> right = List.filled(n, 0);

    // monotonic stack for left
    List<int> stack = [];

    for (int i = 0; i < n; i++) {
      while (stack.isNotEmpty && arr[stack.last] > arr[i]) {
        stack.removeLast();
      }

      left[i] = stack.isEmpty ? i + 1 : i - stack.last;
      stack.add(i);
    }

    stack.clear();

    // monotonic stack for right
    for (int i = n - 1; i >= 0; i--) {
      while (stack.isNotEmpty && arr[stack.last] >= arr[i]) {
        stack.removeLast();
      }

      right[i] = stack.isEmpty ? n - i : stack.last - i;
      stack.add(i);
    }

    int res = 0;

    for (int i = 0; i < n; i++) {
      res = (res + arr[i] * left[i] * right[i]) % mod;
    }

    return res;
  }
}