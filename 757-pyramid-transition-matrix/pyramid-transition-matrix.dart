class Solution {
  bool pyramidTransition(String bottom, List<String> allowed) {
    // Step 1: Build map
    Map<String, List<String>> map = {};
    
    for (String s in allowed) {
      String key = s.substring(0, 2);
      String val = s[2];
      
      map.putIfAbsent(key, () => []);
      map[key]!.add(val);
    }

    // Step 2: Backtracking
    bool dfs(String current) {
      if (current.length == 1) return true;

      List<String> nextLevels = [];

      // Generate all possible next rows
      void buildNext(int index, String path) {
        if (index == current.length - 1) {
          nextLevels.add(path);
          return;
        }

        String key = current.substring(index, index + 2);
        if (!map.containsKey(key)) return;

        for (String c in map[key]!) {
          buildNext(index + 1, path + c);
        }
      }

      buildNext(0, "");

      // Try all possible next rows
      for (String next in nextLevels) {
        if (dfs(next)) return true;
      }

      return false;
    }

    return dfs(bottom);
  }
}