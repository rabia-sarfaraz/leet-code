
class Solution {
  int findTheDistanceValue(List<int> arr1, List<int> arr2, int d) {
    int count = 0;

    for (int num1 in arr1) {
      bool valid = true;

      for (int num2 in arr2) {
        if ((num1 - num2).abs() <= d) {
          valid = false;
          break;
        }
      }

      if (valid) {
        count++;
      }
    }

    return count;
  }
}
