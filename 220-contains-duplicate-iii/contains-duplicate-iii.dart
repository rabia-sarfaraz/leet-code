class Solution {
  bool containsNearbyAlmostDuplicate(
      List<int> nums, int indexDiff, int valueDiff) {
    
    if (valueDiff < 0) return false;

    Map<int, int> bucket = {};
    int w = valueDiff + 1;

    int getBucketId(int num) {
      if (num >= 0) return num ~/ w;
      return ((num + 1) ~/ w) - 1;
    }

    for (int i = 0; i < nums.length; i++) {
      int id = getBucketId(nums[i]);

      // same bucket
      if (bucket.containsKey(id)) return true;

      // left neighbor
      if (bucket.containsKey(id - 1) &&
          (nums[i] - bucket[id - 1]!).abs() <= valueDiff) {
        return true;
      }

      // right neighbor
      if (bucket.containsKey(id + 1) &&
          (nums[i] - bucket[id + 1]!).abs() <= valueDiff) {
        return true;
      }

      bucket[id] = nums[i];

      // sliding window remove
      if (i >= indexDiff) {
        int removeId = getBucketId(nums[i - indexDiff]);
        bucket.remove(removeId);
      }
    }

    return false;
  }
}