class Solution {
  List<List<String>> accountsMerge(List<List<String>> accounts) {
    Map<String, List<String>> graph = {};
    Map<String, String> emailToName = {};

    // Build graph
    for (var acc in accounts) {
      String name = acc[0];

      for (int i = 1; i < acc.length; i++) {
        emailToName[acc[i]] = name;
        graph.putIfAbsent(acc[i], () => []);

        if (i > 1) {
          graph[acc[i]]!.add(acc[i - 1]);
          graph[acc[i - 1]]!.add(acc[i]);
        }
      }
    }

    Set<String> visited = {};
    List<List<String>> result = [];

    void dfs(String email, List<String> emails) {
      visited.add(email);
      emails.add(email);

      for (var nei in graph[email] ?? []) {
        if (!visited.contains(nei)) {
          dfs(nei, emails);
        }
      }
    }

    for (var email in graph.keys) {
      if (!visited.contains(email)) {
        List<String> emails = [];
        dfs(email, emails);

        emails.sort();
        result.add([emailToName[email]!, ...emails]);
      }
    }

    return result;
  }
}