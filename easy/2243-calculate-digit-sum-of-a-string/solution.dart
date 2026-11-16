
class Solution {
  String digitSum(String s, int k) {
    while (s.length > k) {
      String result = '';

      for (int i = 0; i < s.length; i += k) {
        int sum = 0;

        for (int j = i; j < i + k && j < s.length; j++) {
          sum += int.parse(s[j]);
        }

        result += sum.toString();
      }

      s = result;
    }

    return s;
  }
}
