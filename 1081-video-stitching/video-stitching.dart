class Solution {
  int videoStitching(List<List<int>> clips, int time) {
    clips.sort((a, b) => a[0].compareTo(b[0]));

    int res = 0;
    int currEnd = 0;
    int farthest = 0;
    int i = 0;

    while (currEnd < time) {
      while (i < clips.length && clips[i][0] <= currEnd) {
        farthest = farthest > clips[i][1] ? farthest : clips[i][1];
        i++;
      }

      if (farthest == currEnd) return -1;

      res++;
      currEnd = farthest;
    }

    return res;
  }
}