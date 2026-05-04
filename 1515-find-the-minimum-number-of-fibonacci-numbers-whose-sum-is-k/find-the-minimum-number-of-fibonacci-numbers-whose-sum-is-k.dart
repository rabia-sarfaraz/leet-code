class Solution {
  int findMinFibonacciNumbers(int k) {
    // Step 1: Generate Fibonacci numbers
    List<int> fib = [1, 1];
    
    while (fib.last < k) {
      fib.add(fib[fib.length - 1] + fib[fib.length - 2]);
    }

    int count = 0;
    int i = fib.length - 1;

    // Step 2: Greedy
    while (k > 0) {
      if (fib[i] <= k) {
        k -= fib[i];
        count++;
      } else {
        i--;
      }
    }

    return count;
  }
}