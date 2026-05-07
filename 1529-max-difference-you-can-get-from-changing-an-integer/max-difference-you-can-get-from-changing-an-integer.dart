class Solution {
  int maxDiff(int num) {
    String s = num.toString();

    // Max value: replace first non-9 digit with 9
    String a = s;
    for (int i = 0; i < s.length; i++) {
      if (s[i] != '9') {
        a = s.replaceAll(s[i], '9');
        break;
      }
    }

    // Min value: replace first digit with 1 (or 0 logic carefully)
    String b = s;
    if (s[0] != '1') {
      b = s.replaceAll(s[0], '1');
    } else {
      for (int i = 1; i < s.length; i++) {
        if (s[i] != '0' && s[i] != '1') {
          b = s.replaceAll(s[i], '0');
          break;
        }
      }
    }

    return int.parse(a) - int.parse(b);
  }
}