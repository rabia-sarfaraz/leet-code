class Solution {
  List<List<String>> findDuplicate(List<String> paths) {
    Map<String, List<String>> map = {};

    for (String path in paths) {
      List<String> parts = path.split(" ");
      String dir = parts[0];

      for (int i = 1; i < parts.length; i++) {
        String file = parts[i];

        int idx1 = file.indexOf('(');
        int idx2 = file.indexOf(')');

        String fileName = file.substring(0, idx1);
        String content = file.substring(idx1 + 1, idx2);

        String fullPath = "$dir/$fileName";

        map.putIfAbsent(content, () => []);
        map[content]!.add(fullPath);
      }
    }

    List<List<String>> res = [];

    for (var entry in map.entries) {
      if (entry.value.length > 1) {
        res.add(entry.value);
      }
    }

    return res;
  }
}