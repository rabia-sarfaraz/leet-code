class Solution {
  List<String> ambiguousCoordinates(String s) {
    String str = s.substring(1, s.length - 1);
    List<String> res = [];

    List<String> generate(String part) {
      List<String> list = [];

      int n = part.length;

      // no decimal
      if (n == 1 || part[0] != '0') {
        list.add(part);
      }

      // decimal cases
      for (int i = 1; i < n; i++) {
        String left = part.substring(0, i);
        String right = part.substring(i);

        if ((left.length > 1 && left[0] == '0') ||
            right.endsWith('0')) {
          continue;
        }

        list.add("$left.$right");
      }

      return list;
    }

    for (int i = 1; i < str.length; i++) {
      String left = str.substring(0, i);
      String right = str.substring(i);

      List<String> leftList = generate(left);
      List<String> rightList = generate(right);

      for (String l in leftList) {
        for (String r in rightList) {
          res.add("($l, $r)");
        }
      }
    }

    return res;
  }
}