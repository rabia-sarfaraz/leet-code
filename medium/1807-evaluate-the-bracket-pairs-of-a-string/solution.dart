class Solution {
  String evaluate(String s, List<List<String>> knowledge) {
    Map<String, String> map = {};

    for (final pair in knowledge) {
      map[pair[0]] = pair[1];
    }

    StringBuffer result = StringBuffer();

    int i = 0;

    while (i < s.length) {
      if (s[i] == '(') {
        int j = i + 1;

        while (s[j] != ')') {
          j++;
        }

        String key = s.substring(i + 1, j);

        result.write(map[key] ?? '?');

        i = j + 1;
      } else {
        result.write(s[i]);
        i++;
      }
    }

    return result.toString();
  }
}