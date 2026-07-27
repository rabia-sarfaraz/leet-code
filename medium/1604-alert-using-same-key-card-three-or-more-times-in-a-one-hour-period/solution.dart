class Solution {
  List<String> alertNames(List<String> keyName, List<String> keyTime) {
    Map<String, List<int>> mp = {};

    for (int i = 0; i < keyName.length; i++) {
      List<String> t = keyTime[i].split(':');
      int minutes = int.parse(t[0]) * 60 + int.parse(t[1]);

      mp.putIfAbsent(keyName[i], () => []);
      mp[keyName[i]]!.add(minutes);
    }

    List<String> ans = [];

    for (String name in mp.keys) {
      List<int> times = mp[name]!;
      times.sort();

      for (int i = 2; i < times.length; i++) {
        if (times[i] - times[i - 2] <= 60) {
          ans.add(name);
          break;
        }
      }
    }

    ans.sort();
    return ans;
  }
}