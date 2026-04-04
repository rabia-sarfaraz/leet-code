class Solution {
  List<int> productExceptSelf(List<int> nums) {
    int n = nums.length;
    List<int> result = List.filled(n, 1);

    // prefix product
    int prefix = 1;
    for (int i = 0; i < n; i++) {
      result[i] = prefix;
      prefix *= nums[i];
    }

    // suffix product
    int suffix = 1;
    for (int i = n - 1; i >= 0; i--) {
      result[i] *= suffix;
      suffix *= nums[i];
    }

    return result;
  }
}