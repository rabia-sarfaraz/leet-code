class Solution {
  List<int> selfDividingNumbers(int left, int right) {
    
    bool isSelfDividing(int num) {
      int temp = num;

      while (temp > 0) {
        int digit = temp % 10;

        // digit 0 ho ya num digit se divisible na ho
        if (digit == 0 || num % digit != 0) {
          return false;
        }

        temp ~/= 10;
      }

      return true;
    }

    List<int> result = [];

    for (int i = left; i <= right; i++) {
      if (isSelfDividing(i)) {
        result.add(i);
      }
    }

    return result;
  }
}