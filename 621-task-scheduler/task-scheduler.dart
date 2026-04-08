class Solution {
  int leastInterval(List<String> tasks, int n) {
    Map<String, int> freq = {};

    for (String t in tasks) {
      freq[t] = (freq[t] ?? 0) + 1;
    }

    int maxFreq = 0;
    for (int v in freq.values) {
      if (v > maxFreq) maxFreq = v;
    }

    int maxCount = 0;
    for (int v in freq.values) {
      if (v == maxFreq) maxCount++;
    }

    int partCount = maxFreq - 1;
    int partLength = n + 1;
    int minTime = partCount * partLength + maxCount;

    return tasks.length > minTime ? tasks.length : minTime;
  }
}