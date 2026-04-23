class ProductOfNumbers {
  List<int> prefix;

  ProductOfNumbers() : prefix = [1];

  void add(int num) {
    if (num == 0) {
      // reset
      prefix = [1];
    } else {
      prefix.add(prefix.last * num);
    }
  }

  int getProduct(int k) {
    int n = prefix.length;

    // agar k zyada hai → matlab zero beech me tha
    if (k >= n) return 0;

    return prefix[n - 1] ~/ prefix[n - k - 1];
  }
}