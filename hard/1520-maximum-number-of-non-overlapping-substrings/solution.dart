class Solution {
  List<String> maxNumOfSubstrings(String s) {
    int n = s.length;

    List<int> first = List.filled(26, n);
    List<int> last = List.filled(26, -1);

    // First aur last occurrence
    for (int i = 0; i < n; i++) {
      int c = s.codeUnitAt(i) - 97;

      if (first[c] == n) {
        first[c] = i;
      }

      last[c] = i;
    }

    List<List<int>> intervals = [];

    // Har character se minimum valid interval banao
    for (int c = 0; c < 26; c++) {
      if (last[c] == -1) continue;

      int l = first[c];
      int r = last[c];
      bool valid = true;

      int i = l;

      while (i <= r) {
        int x = s.codeUnitAt(i) - 97;

        // Is character ka first occurrence
        // interval ke bahar hai => invalid
        if (first[x] < l) {
          valid = false;
          break;
        }

        if (last[x] > r) {
          r = last[x];
        }

        i++;
      }

      if (valid) {
        intervals.add([l, r]);
      }
    }

    // End ke according sort
    intervals.sort((a, b) => a[1].compareTo(b[1]));

    List<String> answer = [];
    int prevEnd = -1;

    // Maximum non-overlapping intervals
    for (List<int> interval in intervals) {
      int l = interval[0];
      int r = interval[1];

      if (l > prevEnd) {
        answer.add(s.substring(l, r + 1));
        prevEnd = r;
      }
    }

    return answer;
  }
}