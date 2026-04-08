class Solution {
  int maximumSwap(int num) {
    List<String> digits = num.toString().split('');

    List<int> last = List.filled(10, -1);

    // store last occurrence of each digit
    for (int i = 0; i < digits.length; i++) {
      last[int.parse(digits[i])] = i;
    }

    // try to swap
    for (int i = 0; i < digits.length; i++) {
      for (int d = 9; d > int.parse(digits[i]); d--) {
        if (last[d] > i) {
          // swap
          String temp = digits[i];
          digits[i] = digits[last[d]];
          digits[last[d]] = temp;

          return int.parse(digits.join());
        }
      }
    }

    return num;
  }
}