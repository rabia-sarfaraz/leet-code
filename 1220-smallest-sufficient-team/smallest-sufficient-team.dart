class Solution {
  List<int> smallestSufficientTeam(List<String> req_skills, List<List<String>> people) {
    int m = req_skills.length;
    
    // Step 1: skill -> index
    Map<String, int> skillIndex = {};
    for (int i = 0; i < m; i++) {
      skillIndex[req_skills[i]] = i;
    }
    
    // Step 2: people bitmask
    List<int> peopleMask = [];
    
    for (var person in people) {
      int mask = 0;
      for (var skill in person) {
        if (skillIndex.containsKey(skill)) {
          mask |= (1 << skillIndex[skill]!);
        }
      }
      peopleMask.add(mask);
    }
    
    // Step 3: DP
    Map<int, List<int>> dp = {};
    dp[0] = [];
    
    for (int i = 0; i < people.length; i++) {
      int pMask = peopleMask[i];
      
      if (pMask == 0) continue;
      
      Map<int, List<int>> newDp = Map.from(dp);
      
      for (var entry in dp.entries) {
        int curMask = entry.key;
        List<int> team = entry.value;
        
        int newMask = curMask | pMask;
        
        if (!newDp.containsKey(newMask) ||
            newDp[newMask]!.length > team.length + 1) {
          newDp[newMask] = [...team, i];
        }
      }
      
      dp = newDp;
    }
    
    int fullMask = (1 << m) - 1;
    return dp[fullMask]!;
  }
}