class Solution {
  List<int> nextGreaterElement(List<int> nums1, List<int> nums2) {
    Map<int, int> nextGreater = {};
    List<int> stack = [];

    for (int num in nums2) {
      while (stack.isNotEmpty && num > stack.last) {
        nextGreater[stack.removeLast()] = num;
      }
      stack.add(num);
    }

    while (stack.isNotEmpty) {
      nextGreater[stack.removeLast()] = -1;
    }

    List<int> result = [];

    for (int num in nums1) {
      result.add(nextGreater[num] ?? -1);
    }

    return result;
  }
}