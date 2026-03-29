class Solution {
  List<String> restoreIpAddresses(String s) {
    List<String> result = [];

    void backtrack(int index, List<String> parts) {
      // 4 parts complete + string end
      if (parts.length == 4) {
        if (index == s.length) {
          result.add(parts.join('.'));
        }
        return;
      }

      for (int len = 1; len <= 3; len++) {
        if (index + len > s.length) break;

        String segment = s.substring(index, index + len);

        // leading zero check
        if (segment.startsWith('0') && segment.length > 1) continue;

        int value = int.parse(segment);
        if (value > 255) continue;

        parts.add(segment);
        backtrack(index + len, parts);
        parts.removeLast();
      }
    }

    backtrack(0, []);
    return result;
  }
}