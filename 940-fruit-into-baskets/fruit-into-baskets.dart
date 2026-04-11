class Solution {
  int totalFruit(List<int> fruits) {
    Map<int, int> freq = {};

    int left = 0;
    int maxLen = 0;

    for (int right = 0; right < fruits.length; right++) {
      freq[fruits[right]] = (freq[fruits[right]] ?? 0) + 1;

      while (freq.length > 2) {
        freq[fruits[left]] = freq[fruits[left]]! - 1;

        if (freq[fruits[left]] == 0) {
          freq.remove(fruits[left]);
        }

        left++;
      }

      maxLen = maxLen > (right - left + 1)
          ? maxLen
          : (right - left + 1);
    }

    return maxLen;
  }
}