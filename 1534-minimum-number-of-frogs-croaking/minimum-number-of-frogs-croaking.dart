class Solution {
  int minNumberOfFrogs(String croakOfFrogs) {
    Map<String, int> count = {
      'c': 0,
      'r': 0,
      'o': 0,
      'a': 0,
      'k': 0
    };

    int frogs = 0;
    int maxFrogs = 0;

    for (int i = 0; i < croakOfFrogs.length; i++) {
      String ch = croakOfFrogs[i];

      count[ch] = count[ch]! + 1;

      // order check
      if (count['r']! > count['c']! ||
          count['o']! > count['r']! ||
          count['a']! > count['o']! ||
          count['k']! > count['a']!) {
        return -1;
      }

      if (ch == 'c') {
        frogs++; // new frog started
        maxFrogs = frogs > maxFrogs ? frogs : maxFrogs;
      }

      if (ch == 'k') {
        frogs--; // one frog finished
      }
    }

    // all counts equal hone chahiye
    if (count['c'] != count['r'] ||
        count['r'] != count['o'] ||
        count['o'] != count['a'] ||
        count['a'] != count['k']) {
      return -1;
    }

    return maxFrogs;
  }
}