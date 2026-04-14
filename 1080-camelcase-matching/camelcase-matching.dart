class Solution {
  List<bool> camelMatch(List<String> queries, String pattern) {
    List<bool> result = [];

    for (String q in queries) {
      result.add(isMatch(q, pattern));
    }

    return result;
  }

  bool isMatch(String query, String pattern) {
    int i = 0, j = 0;

    while (i < query.length) {
      if (j < pattern.length && query[i] == pattern[j]) {
        i++;
        j++;
      } else {
        // If uppercase letter doesn't match → false
        if (query[i].toUpperCase() == query[i]) {
          return false;
        }
        i++;
      }
    }

    return j == pattern.length;
  }
}