class Solution {
  List<int> majorityElement(List<int> nums) {
    int? cand1, cand2;
    int count1 = 0, count2 = 0;

    for (int num in nums) {
      if (cand1 == num) {
        count1++;
      } else if (cand2 == num) {
        count2++;
      } else if (count1 == 0) {
        cand1 = num;
        count1 = 1;
      } else if (count2 == 0) {
        cand2 = num;
        count2 = 1;
      } else {
        count1--;
        count2--;
      }
    }

    // verify
    count1 = 0;
    count2 = 0;

    for (int num in nums) {
      if (num == cand1) count1++;
      else if (num == cand2) count2++;
    }

    List<int> result = [];
    int n = nums.length;

    if (count1 > n ~/ 3) result.add(cand1!);
    if (count2 > n ~/ 3) result.add(cand2!);

    return result;
  }
}