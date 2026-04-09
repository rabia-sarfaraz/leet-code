class Solution {
  String customSortString(String order, String s) {
    Map<String, int> freq = {};

    for (var ch in s.split('')) {
      freq[ch] = (freq[ch] ?? 0) + 1;
    }

    StringBuffer sb = StringBuffer();

    // step 1: follow order
    for (var ch in order.split('')) {
      if (freq.containsKey(ch)) {
        sb.write(ch * freq[ch]!);
        freq.remove(ch);
      }
    }

    // step 2: remaining characters
    freq.forEach((ch, count) {
      sb.write(ch * count);
    });

    return sb.toString();
  }
}