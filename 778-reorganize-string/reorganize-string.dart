import 'dart:collection';

class Solution {
  String reorganizeString(String s) {
    int n = s.length;

    // Step 1: frequency map
    Map<String, int> freq = {};
    for (int i = 0; i < n; i++) {
      freq[s[i]] = (freq[s[i]] ?? 0) + 1;
    }

    // Check impossible case
    for (var f in freq.values) {
      if (f > (n + 1) ~/ 2) return "";
    }

    // Step 2: max heap (list sort trick)
    List<MapEntry<String, int>> pq = freq.entries.toList();

    StringBuffer res = StringBuffer();

    while (pq.isNotEmpty) {
      pq.sort((a, b) => b.value.compareTo(a.value));

      if (pq.length == 1) {
        res.write(pq[0].key);
        pq[0] = MapEntry(pq[0].key, pq[0].value - 1);
      } else {
        var first = pq[0];
        var second = pq[1];

        res.write(first.key);
        res.write(second.key);

        pq[0] = MapEntry(first.key, first.value - 1);
        pq[1] = MapEntry(second.key, second.value - 1);
      }

      pq.removeWhere((e) => e.value == 0);
    }

    return res.toString();
  }
}