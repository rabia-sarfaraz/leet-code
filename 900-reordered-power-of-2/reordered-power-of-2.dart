class Solution {
  bool reorderedPowerOf2(int n) {
    String target = countDigits(n);

    for (int i = 0; i < 31; i++) {
      int power = 1 << i;
      if (countDigits(power) == target) {
        return true;
      }
    }

    return false;
  }

  String countDigits(int n) {
    List<int> freq = List.filled(10, 0);

    while (n > 0) {
      freq[n % 10]++;
      n ~/= 10;
    }

    return freq.join(',');
  }
}