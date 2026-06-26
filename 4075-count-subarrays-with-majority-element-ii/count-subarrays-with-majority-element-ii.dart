class Solution {
  int countMajoritySubarrays(List<int> nums, int target) {
    int n = nums.length;

    // Prefix sums
    List<int> prefix = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] + (nums[i] == target ? 1 : -1);
    }

    // Coordinate compression
    List<int> values = List.from(prefix);
    values.sort();

    Map<int, int> index = {};
    int id = 1;
    for (int v in values) {
      if (!index.containsKey(v)) {
        index[v] = id++;
      }
    }

    // Fenwick Tree
    List<int> bit = List.filled(id + 2, 0);

    void update(int i) {
      while (i < bit.length) {
        bit[i]++;
        i += i & -i;
      }
    }

    int query(int i) {
      int res = 0;
      while (i > 0) {
        res += bit[i];
        i -= i & -i;
      }
      return res;
    }

    int ans = 0;

    update(index[prefix[0]]!);

    for (int i = 1; i <= n; i++) {
      int pos = index[prefix[i]]!;
      ans += query(pos - 1); // count previous prefix sums < current
      update(pos);
    }

    return ans;
  }
}