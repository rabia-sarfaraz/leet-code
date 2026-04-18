class Solution {
  List<int> sequentialDigits(int low, int high) {
    List<int> result = [];

    String digits = "123456789";

    for (int i = 0; i < 9; i++) {
      int num = 0;

      for (int j = i; j < 9; j++) {
        num = num * 10 + (digits[j].codeUnitAt(0) - 48);

        if (num >= low && num <= high) {
          result.add(num);
        }
      }
    }

    result.sort();
    return result;
  }
}