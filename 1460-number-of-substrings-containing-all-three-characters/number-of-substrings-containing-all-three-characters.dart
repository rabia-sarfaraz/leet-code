class Solution {
  int numberOfSubstrings(String s) {
    int n = s.length;
    List<int> count = List.filled(3, 0);

    int left = 0;
    int result = 0;

    for (int right = 0; right < n; right++) {
      count[s.codeUnitAt(right) - 'a'.codeUnitAt(0)]++;

      // jab tak a,b,c sab hain
      while (count[0] > 0 && count[1] > 0 && count[2] > 0) {
        result += (n - right);

        // shrink window
        count[s.codeUnitAt(left) - 'a'.codeUnitAt(0)]--;
        left++;
      }
    }

    return result;
  }
}