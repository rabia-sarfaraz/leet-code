class Solution {
  List<int> diStringMatch(String s) {
    int low = 0;
    int high = s.length;

    List<int> res = [];

    for (int i = 0; i < s.length; i++) {
      if (s[i] == 'I') {
        res.add(low);
        low++;
      } else {
        res.add(high);
        high--;
      }
    }

    // last remaining number
    res.add(low);

    return res;
  }
}