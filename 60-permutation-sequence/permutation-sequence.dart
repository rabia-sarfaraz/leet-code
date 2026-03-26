class Solution {
  String getPermutation(int n, int k) {
    List<int> numbers = List.generate(n, (i) => i + 1);
    List<int> factorial = List.filled(n, 1);

    // factorial precompute
    for (int i = 1; i < n; i++) {
      factorial[i] = factorial[i - 1] * i;
    }

    k--; // convert to 0-based index

    StringBuffer result = StringBuffer();

    for (int i = n; i >= 1; i--) {
      int index = k ~/ factorial[i - 1];
      result.write(numbers[index]);

      numbers.removeAt(index);

      k %= factorial[i - 1];
    }

    return result.toString();
  }
}