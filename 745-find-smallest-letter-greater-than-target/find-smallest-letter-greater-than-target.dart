class Solution {
  String nextGreatestLetter(List<String> letters, String target) {
    int l = 0, r = letters.length - 1;

    while (l <= r) {
      int mid = (l + r) ~/ 2;

      if (letters[mid].compareTo(target) <= 0) {
        l = mid + 1;
      } else {
        r = mid - 1;
      }
    }

    // wrap around
    return letters[l % letters.length];
  }
}