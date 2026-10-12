
class Solution {
  int maxSum(List<int> nums, int k) {
    const int mod = 1000000007;
    List<int> bits = List.filled(30, 0);

    for (int num in nums) {
      for (int b = 0; b < 30; b++) {
        if ((num & (1 << b)) != 0) {
          bits[b]++;
        }
      }
    }

    int answer = 0;

    for (int i = 0; i < k; i++) {
      int num = 0;

      for (int b = 29; b >= 0; b--) {
        if (bits[b] > 0) {
          num |= (1 << b);
          bits[b]--;
        }
      }

      answer = (answer + num * num) % mod;
    }

    return answer;
  }
}
