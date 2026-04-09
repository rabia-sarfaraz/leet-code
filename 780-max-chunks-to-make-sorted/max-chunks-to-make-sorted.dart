class Solution {
  int maxChunksToSorted(List<int> arr) {
    int chunks = 0;
    int maxSoFar = 0;

    for (int i = 0; i < arr.length; i++) {
      if (arr[i] > maxSoFar) {
        maxSoFar = arr[i];
      }

      if (maxSoFar == i) {
        chunks++;
      }
    }

    return chunks;
  }
}