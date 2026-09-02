class Solution {
  bool uniformArray(List<int> nums1) {
    int minValue = nums1.reduce((a, b) => a < b ? a : b);

    for (int num in nums1) {
      // Agar koi number minimum se different hai
      // aur dono odd hain, to uniform banana possible nahi.
      if (num % 2 != minValue % 2) {
        return true;
      }
    }

    return true;
  }
}