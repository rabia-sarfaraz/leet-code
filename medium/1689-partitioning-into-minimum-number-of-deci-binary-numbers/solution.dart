class Solution {
  int minPartitions(String n) {
    int maxDigit = 0;

    for (String digit in n.split('')) {
      int value = int.parse(digit);

      if (value > maxDigit) {
        maxDigit = value;
      }
    }

    return maxDigit;
  }
}