
class Solution {
  static const int mod = 1000000007;

  late List<int> sumTree;
  late List<int> squareTree;
  late List<int> lazy;
  late int n;

  void apply(int node, int left, int right, int value) {
    int len = right - left + 1;
    int oldSum = sumTree[node];

    squareTree[node] = (
      squareTree[node] +
      (2 * value * oldSum) % mod +
      ((value * value) % mod) * len
    ) % mod;

    sumTree[node] = (oldSum + value * len) % mod;
    lazy[node] = (lazy[node] + value) % mod;
  }

  void pushDown(int node, int left, int right) {
    if (lazy[node] == 0 || left == right) return;

    int mid = (left + right) ~/ 2;
    int value = lazy[node];

    apply(node * 2, left, mid, value);
    apply(node * 2 + 1, mid + 1, right, value);

    lazy[node] = 0;
  }

  void update(
    int node,
    int start,
    int end,
    int ql,
    int qr,
    int value,
  ) {
    if (ql > end || qr < start) return;

    if (ql <= start && end <= qr) {
      apply(node, start, end, value);
      return;
    }

    pushDown(node, start, end);

    int mid = (start + end) ~/ 2;

    update(node * 2, start, mid, ql, qr, value);
    update(node * 2 + 1, mid + 1, end, ql, qr, value);

    sumTree[node] =
        (sumTree[node * 2] + sumTree[node * 2 + 1]) % mod;

    squareTree[node] =
        (squareTree[node * 2] + squareTree[node * 2 + 1]) % mod;
  }

  int sumCounts(List<int> nums) {
    n = nums.length;

    sumTree = List.filled(4 * n, 0);
    squareTree = List.filled(4 * n, 0);
    lazy = List.filled(4 * n, 0);

    List<int> last = List.filled(100001, -1);
    int answer = 0;

    for (int i = 0; i < n; i++) {
      int previous = last[nums[i]];

      update(
        1, 0, n - 1,
        previous + 1, i, 1,
      );

      answer = (answer + squareTree[1]) % mod;
      last[nums[i]] = i;
    }

    return answer;
  }
}
