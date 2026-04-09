class Solution {
  int expressiveWords(String s, List<String> words) {
    
    List<List<dynamic>> encode(String str) {
      List<List<dynamic>> res = [];
      int i = 0;

      while (i < str.length) {
        int j = i;
        while (j < str.length && str[j] == str[i]) {
          j++;
        }
        res.add([str[i], j - i]);
        i = j;
      }

      return res;
    }

    var sGroups = encode(s);
    int count = 0;

    for (String w in words) {
      var wGroups = encode(w);

      if (wGroups.length != sGroups.length) continue;

      bool ok = true;

      for (int i = 0; i < sGroups.length; i++) {
        var sc = sGroups[i][0];
        var sw = wGroups[i][0];
        var sl = sGroups[i][1];
        var wl = wGroups[i][1];

        if (sc != sw) {
          ok = false;
          break;
        }

        if (sl < 3 && sl != wl) {
          ok = false;
          break;
        }

        if (sl >= 3 && wl > sl) {
          ok = false;
          break;
        }
      }

      if (ok) count++;
    }

    return count;
  }
}