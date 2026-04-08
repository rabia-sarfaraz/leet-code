class Solution {
  String optimalDivision(List<int> nums) {
    int n = nums.length;
    
    if (n == 1) return nums[0].toString();
    if (n == 2) return "${nums[0]}/${nums[1]}";
    
    String result = "${nums[0]}/(";
    
    for (int i = 1; i < n; i++) {
      result += nums[i].toString();
      if (i != n - 1) result += "/";
    }
    
    result += ")";
    
    return result;
  }
}