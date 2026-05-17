class Solution {
  List<int> getStrongest(List<int> arr, int k) {
    arr.sort();

    int n = arr.length;
    int median = arr[(n - 1) ~/ 2];

    int left = 0;
    int right = n - 1;

    List<int> ans = [];

    while (ans.length < k) {
      int leftStrength = (arr[left] - median).abs();
      int rightStrength = (arr[right] - median).abs();

      if (rightStrength > leftStrength) {
        ans.add(arr[right]);
        right--;
      } else if (rightStrength < leftStrength) {
        ans.add(arr[left]);
        left++;
      } else {
        // if equal strength, take larger number
        if (arr[right] > arr[left]) {
          ans.add(arr[right]);
          right--;
        } else {
          ans.add(arr[left]);
          left++;
        }
      }
    }

    return ans;
  }
}