class Solution {
  String countAndSay(int n) {
    String result = "1";

    for (int i = 2; i <= n; i++) {
      result = getNext(result);
    }

    return result;
  }

  String getNext(String s) {
    StringBuffer sb = StringBuffer();
    int count = 1;

    for (int i = 1; i < s.length; i++) {
      if (s[i] == s[i - 1]) {
        count++;
      } else {
        sb.write(count.toString());
        sb.write(s[i - 1]);
        count = 1;
      }
    }

    // last group
    sb.write(count.toString());
    sb.write(s[s.length - 1]);

    return sb.toString();
  }
}