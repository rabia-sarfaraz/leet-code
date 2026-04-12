class Solution {
  int threeSumMulti(List<int> arr, int target) {
    const int MOD = 1000000007;

    List<int> count = List.filled(101, 0);

    for (int num in arr) {
      count[num]++;
    }

    int result = 0;

    for (int i = 0; i <= 100; i++) {
      if (count[i] == 0) continue;

      for (int j = i; j <= 100; j++) {
        if (count[j] == 0) continue;

        int k = target - i - j;
        if (k < 0 || k > 100) continue;
        if (count[k] == 0) continue;

        // case 1: i == j == k
        if (i == j && j == k) {
          int c = count[i];
          result = (result + (c * (c - 1) * (c - 2) ~/ 6)) % MOD;
        }

        // case 2: i == j != k
        else if (i == j && j != k) {
          int c = count[i];
          result = (result + (c * (c - 1) ~/ 2) * count[k]) % MOD;
        }

        // case 3: i < j < k
        else if (i < j && j < k) {
          result = (result + count[i] * count[j] * count[k]) % MOD;
        }
      }
    }

    return result;
  }
}