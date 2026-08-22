class Solution {
  int minimumTeachings(
      int n,
      List<List<int>> languages,
      List<List<int>> friendships) {
    
    Set<int> needTeach = {};

    // Jin friendships mein common language nahi hai
    // un users ko find karo
    for (var friendship in friendships) {
      int u = friendship[0] - 1;
      int v = friendship[1] - 1;

      Set<int> langU = languages[u].toSet();

      bool canCommunicate = false;

      for (int lang in languages[v]) {
        if (langU.contains(lang)) {
          canCommunicate = true;
          break;
        }
      }

      if (!canCommunicate) {
        needTeach.add(u);
        needTeach.add(v);
      }
    }

    int answer = languages.length;

    // Har language ko try karo
    for (int lang = 1; lang <= n; lang++) {
      int count = 0;

      // Kitne required users ko ye language nahi aati
      for (int user in needTeach) {
        if (!languages[user].contains(lang)) {
          count++;
        }
      }

      answer = answer < count ? answer : count;
    }

    return answer;
  }
}