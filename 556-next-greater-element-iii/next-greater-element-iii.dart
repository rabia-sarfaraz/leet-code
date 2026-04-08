class Solution {
  int nextGreaterElement(int n) {
    List<int> digits = n.toString().split('').map(int.parse).toList();
    
    int i = digits.length - 2;
    
    // Step 1: find first decreasing element
    while (i >= 0 && digits[i] >= digits[i + 1]) {
      i--;
    }
    
    if (i < 0) return -1;
    
    // Step 2: find just greater element and swap
    int j = digits.length - 1;
    while (digits[j] <= digits[i]) {
      j--;
    }
    
    int temp = digits[i];
    digits[i] = digits[j];
    digits[j] = temp;
    
    // Step 3: reverse remaining part
    int left = i + 1, right = digits.length - 1;
    while (left < right) {
      int t = digits[left];
      digits[left] = digits[right];
      digits[right] = t;
      left++;
      right--;
    }
    
    // Step 4: convert to number
    int result = int.parse(digits.join());
    
    // check 32-bit limit
    if (result > 2147483647) return -1;
    
    return result;
  }
}