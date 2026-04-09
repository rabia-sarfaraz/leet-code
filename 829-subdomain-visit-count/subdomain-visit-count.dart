class Solution {
  List<String> subdomainVisits(List<String> cpdomains) {
    Map<String, int> map = {};

    for (String entry in cpdomains) {
      List<String> parts = entry.split(" ");
      int count = int.parse(parts[0]);
      String domain = parts[1];

      List<String> frags = domain.split(".");

      for (int i = 0; i < frags.length; i++) {
        String sub = frags.sublist(i).join(".");
        map[sub] = (map[sub] ?? 0) + count;
      }
    }

    List<String> res = [];

    map.forEach((key, value) {
      res.add("$value $key");
    });

    return res;
  }
}