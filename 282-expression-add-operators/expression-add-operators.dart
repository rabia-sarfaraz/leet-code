class Solution {
  List<String> addOperators(String num, int target) {
    List<String> result = [];

    void dfs(int index, String path, int value, int prev) {
      if (index == num.length) {
        if (value == target) {
          result.add(path);
        }
        return;
      }

      for (int i = index; i < num.length; i++) {
        // avoid numbers with leading zero
        if (i != index && num[index] == '0') break;

        String partStr = num.substring(index, i + 1);
        int cur = int.parse(partStr);

        if (index == 0) {
          dfs(i + 1, partStr, cur, cur);
        } else {
          dfs(i + 1, "$path+$partStr", value + cur, cur);
          dfs(i + 1, "$path-$partStr", value - cur, -cur);

          // multiplication
          dfs(
            i + 1,
            "$path*$partStr",
            value - prev + prev * cur,
            prev * cur,
          );
        }
      }
    }

    dfs(0, "", 0, 0);
    return result;
  }
}