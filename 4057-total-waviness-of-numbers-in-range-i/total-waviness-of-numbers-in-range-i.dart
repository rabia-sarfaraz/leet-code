class Solution {
  int totalWaviness(int num1, int num2) {
    int ans = 0;

    for (int x = num1; x <= num2; x++) {
      ans += waviness(x);
    }

    return ans;
  }

  int waviness(int x) {
    List<int> digits = x.toString().split('').map(int.parse).toList();

    if (digits.length < 3) return 0;

    int count = 0;

    for (int i = 1; i < digits.length - 1; i++) {
      if ((digits[i] > digits[i - 1] && digits[i] > digits[i + 1]) ||
          (digits[i] < digits[i - 1] && digits[i] < digits[i + 1])) {
        count++;
      }
    }

    return count;
  }
}