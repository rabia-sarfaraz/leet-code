class Solution {
  int countMatches(
      List<List<String>> items,
      String ruleKey,
      String ruleValue) {

    int index;

    if (ruleKey == "type") {
      index = 0;
    } else if (ruleKey == "color") {
      index = 1;
    } else {
      index = 2;
    }

    int count = 0;

    for (List<String> item in items) {
      if (item[index] == ruleValue) {
        count++;
      }
    }

    return count;
  }
}