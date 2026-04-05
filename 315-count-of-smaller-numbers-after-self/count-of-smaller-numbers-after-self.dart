class Solution {
  List<int> countSmaller(List<int> nums) {
    int n = nums.length;
    List<int> result = List.filled(n, 0);
    List<int> indices = List.generate(n, (i) => i);

    void mergeSort(int left, int right) {
      if (right - left <= 1) return;

      int mid = (left + right) ~/ 2;

      mergeSort(left, mid);
      mergeSort(mid, right);

      List<int> temp = [];
      int i = left, j = mid;
      int rightCount = 0;

      while (i < mid && j < right) {
        if (nums[indices[j]] < nums[indices[i]]) {
          rightCount++;
          temp.add(indices[j]);
          j++;
        } else {
          result[indices[i]] += rightCount;
          temp.add(indices[i]);
          i++;
        }
      }

      while (i < mid) {
        result[indices[i]] += rightCount;
        temp.add(indices[i]);
        i++;
      }

      while (j < right) {
        temp.add(indices[j]);
        j++;
      }

      for (int k = left; k < right; k++) {
        indices[k] = temp[k - left];
      }
    }

    mergeSort(0, n);

    return result;
  }
}