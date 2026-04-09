class Solution {
  int numJewelsInStones(String jewels, String stones) {
    Set<String> j = jewels.split('').toSet();

    int count = 0;
    for (int i = 0; i < stones.length; i++) {
      if (j.contains(stones[i])) {
        count++;
      }
    }

    return count;
  }
}