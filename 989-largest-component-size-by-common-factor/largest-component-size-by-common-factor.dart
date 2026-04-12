class Solution {
  late List<int> parent;
  late List<int> size;

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  void union(int a, int b) {
    int pa = find(a);
    int pb = find(b);
    if (pa == pb) return;

    if (size[pa] < size[pb]) {
      parent[pa] = pb;
      size[pb] += size[pa];
    } else {
      parent[pb] = pa;
      size[pa] += size[pb];
    }
  }

  int largestComponentSize(List<int> nums) {
    int n = nums.length;
    parent = List.generate(n, (i) => i);
    size = List.filled(n, 1);

    Map<int, int> factorMap = {}; // factor -> index

    for (int i = 0; i < n; i++) {
      int num = nums[i];

      for (int f = 2; f * f <= num; f++) {
        if (num % f == 0) {
          // factor f
          if (factorMap.containsKey(f)) {
            union(i, factorMap[f]!);
          } else {
            factorMap[f] = i;
          }

          // factor num/f
          int other = num ~/ f;
          if (factorMap.containsKey(other)) {
            union(i, factorMap[other]!);
          } else {
            factorMap[other] = i;
          }
        }
      }

      // handle prime itself
      if (num > 1) {
        if (factorMap.containsKey(num)) {
          union(i, factorMap[num]!);
        } else {
          factorMap[num] = i;
        }
      }
    }

    int ans = 0;
    for (int i = 0; i < n; i++) {
      ans = ans > size[find(i)] ? ans : size[find(i)];
    }

    return ans;
  }
}