
class FenwickTree {
  final int n;
  late List<int> tree;

  FenwickTree(this.n) {
    tree = List.filled(n + 1, 0);
  }

  void add(int index, int value) {
    while (index <= n) {
      tree[index] += value;
      index += index & -index;
    }
  }

  int query(int index) {
    int result = 0;

    while (index > 0) {
      result += tree[index];
      index -= index & -index;
    }

    return result;
  }

  int kth(int k) {
    int index = 0;
    int step = 1;

    while ((step << 1) <= n) {
      step <<= 1;
    }

    while (step > 0) {
      int next = index + step;

      if (next <= n && tree[next] < k) {
        index = next;
        k -= tree[next];
      }

      step >>= 1;
    }

    return index + 1;
  }
}

class Solution {
  int minOperations(List<int> nums, int x, int k) {
    int n = nums.length;

    // Coordinate compression
    List<int> values = nums.toSet().toList()..sort();

    int size = values.length;

    Map<int, int> ranks = {};

    for (int i = 0; i < size; i++) {
      ranks[values[i]] = i + 1;
    }

    FenwickTree countTree = FenwickTree(size);
    FenwickTree sumTree = FenwickTree(size);

    // Add and remove elements
    void update(int num, int delta) {
      int index = ranks[num]!;

      countTree.add(index, delta);
      sumTree.add(index, num * delta);
    }

    // Calculate minimum operations for current window
    int getCost(int windowSum) {
      int medianIndex = countTree.kth((x + 1) ~/ 2);

      int median = values[medianIndex - 1];

      int leftCount = countTree.query(medianIndex);
      int leftSum = sumTree.query(medianIndex);

      int rightCount = x - leftCount;
      int rightSum = windowSum - leftSum;

      return median * leftCount -
          leftSum +
          rightSum -
          median * rightCount;
    }

    // Calculate cost of every window of size x
    List<int> costs = [];

    int windowSum = 0;

    for (int i = 0; i < x; i++) {
      update(nums[i], 1);
      windowSum += nums[i];
    }

    costs.add(getCost(windowSum));

    for (int i = x; i < n; i++) {
      update(nums[i - x], -1);
      windowSum -= nums[i - x];

      update(nums[i], 1);
      windowSum += nums[i];

      costs.add(getCost(windowSum));
    }

    // Dynamic Programming
    const int inf = 1 << 60;

    List<List<int>> dp = List.generate(
      k + 1,
      (_) => List.filled(n + 1, inf),
    );

    // Zero selected subarrays requires zero operations
    for (int i = 0; i <= n; i++) {
      dp[0][i] = 0;
    }

    for (int t = 1; t <= k; t++) {
      for (int i = 1; i <= n; i++) {
        // Skip current position
        dp[t][i] = dp[t][i - 1];

        // Select a window ending at i - 1
        if (i >= x) {
          int previous = dp[t - 1][i - x];

          if (previous != inf) {
            int candidate = previous + costs[i - x];

            if (candidate < dp[t][i]) {
              dp[t][i] = candidate;
            }
          }
        }
      }
    }

    return dp[k][n];
  }
}
