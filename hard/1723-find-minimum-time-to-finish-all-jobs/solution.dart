class Solution {
  int minimumTimeRequired(List<int> jobs, int k) {
    // Large jobs pehle assign karo
    jobs.sort((a, b) => b.compareTo(a));

    List<int> workers = List.filled(k, 0);
    int answer = jobs.fold(0, (a, b) => a + b);

    void backtrack(int index, int currentMax) {
      if (currentMax >= answer) return;

      if (index == jobs.length) {
        answer = currentMax;
        return;
      }

      int job = jobs[index];
      Set<int> usedLoads = {};

      for (int i = 0; i < k; i++) {
        // Same workload wale workers ko repeat na karo
        if (usedLoads.contains(workers[i])) continue;
        usedLoads.add(workers[i]);

        workers[i] += job;

        backtrack(
          index + 1,
          currentMax > workers[i] ? currentMax : workers[i],
        );

        workers[i] -= job;

        // Agar empty worker ko job dekar bhi solution nahi mila,
        // to doosre empty workers try karne ki zaroorat nahi
        if (workers[i] == 0) break;
      }
    }

    backtrack(0, 0);

    return answer;
  }
}