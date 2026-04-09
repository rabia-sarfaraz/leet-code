class Solution {
  String makeLargestSpecial(String s) {
    if (s.length <= 2) return s;

    List<String> res = [];
    int count = 0, start = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '1') count++;
      else count--;

      // Found a special substring
      if (count == 0) {
        String inner = s.substring(start + 1, i);
        String processed = makeLargestSpecial(inner);
        res.add('1' + processed + '0');
        start = i + 1;
      }
    }

    // Sort descending for largest result
    res.sort((a, b) => b.compareTo(a));

    return res.join();
  }
}