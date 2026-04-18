class Solution {
  String freqAlphabets(String s) {
    StringBuffer res = StringBuffer();

    for (int i = 0; i < s.length; i++) {
      if (i + 2 < s.length && s[i + 2] == '#') {
        int num = int.parse(s.substring(i, i + 2));
        res.write(String.fromCharCode(96 + num));
        i += 2;
      } else {
        int num = int.parse(s[i]);
        res.write(String.fromCharCode(96 + num));
      }
    }

    return res.toString();
  }
}