class Solution {
  int maximumSum(List<int> arr) {
    int n = arr.length;

    List<int> forward = List.filled(n, 0);
    List<int> backward = List.filled(n, 0);

    // forward (Kadane)
    forward[0] = arr[0];
    for (int i = 1; i < n; i++) {
      forward[i] = (forward[i - 1] + arr[i]).clamp(arr[i], 1 << 60);
    }

    // backward
    backward[n - 1] = arr[n - 1];
    for (int i = n - 2; i >= 0; i--) {
      backward[i] = (backward[i + 1] + arr[i]).clamp(arr[i], 1 << 60);
    }

    int ans = arr[0];

    // case: no deletion
    for (int x in forward) {
      if (x > ans) ans = x;
    }

    // case: delete one element
    for (int i = 1; i < n - 1; i++) {
      int val = forward[i - 1] + backward[i + 1];
      if (val > ans) ans = val;
    }

    return ans;
  }
}