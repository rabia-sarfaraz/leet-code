import java.util.*;

class Solution {

    public int minJumps(int[] nums) {
        int n = nums.length;

        if (n == 1) return 0;

        // value -> indices divisible by prime
        Map<Integer, List<Integer>> primeToIndices = new HashMap<>();

        for (int i = 0; i < n; i++) {
            List<Integer> factors = getPrimeFactors(nums[i]);

            for (int p : factors) {
                primeToIndices
                    .computeIfAbsent(p, k -> new ArrayList<>())
                    .add(i);
            }
        }

        Queue<Integer> q = new LinkedList<>();
        boolean[] visited = new boolean[n];

        q.offer(0);
        visited[0] = true;

        int jumps = 0;

        while (!q.isEmpty()) {
            int size = q.size();

            while (size-- > 0) {
                int i = q.poll();

                if (i == n - 1) return jumps;

                // Move left
                if (i - 1 >= 0 && !visited[i - 1]) {
                    visited[i - 1] = true;
                    q.offer(i - 1);
                }

                // Move right
                if (i + 1 < n && !visited[i + 1]) {
                    visited[i + 1] = true;
                    q.offer(i + 1);
                }

                // Prime teleportation
                if (isPrime(nums[i])) {
                    int p = nums[i];

                    if (primeToIndices.containsKey(p)) {

                        for (int next : primeToIndices.get(p)) {
                            if (!visited[next]) {
                                visited[next] = true;
                                q.offer(next);
                            }
                        }

                        // Important optimization
                        primeToIndices.remove(p);
                    }
                }
            }

            jumps++;
        }

        return -1;
    }

    // Get unique prime factors
    private List<Integer> getPrimeFactors(int num) {
        List<Integer> factors = new ArrayList<>();

        for (int p = 2; p * p <= num; p++) {
            if (num % p == 0) {
                factors.add(p);

                while (num % p == 0) {
                    num /= p;
                }
            }
        }

        if (num > 1) {
            factors.add(num);
        }

        return factors;
    }

    // Check prime
    private boolean isPrime(int x) {
        if (x < 2) return false;

        for (int i = 2; i * i <= x; i++) {
            if (x % i == 0) return false;
        }

        return true;
    }
}