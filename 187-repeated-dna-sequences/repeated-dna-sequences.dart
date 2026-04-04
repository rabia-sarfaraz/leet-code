class Solution {
  List<String> findRepeatedDnaSequences(String s) {
    if (s.length < 10) return [];

    Set<String> seen = {};
    Set<String> repeated = {};

    for (int i = 0; i <= s.length - 10; i++) {
      String sub = s.substring(i, i + 10);

      if (seen.contains(sub)) {
        repeated.add(sub);
      } else {
        seen.add(sub);
      }
    }

    return repeated.toList();
  }
}