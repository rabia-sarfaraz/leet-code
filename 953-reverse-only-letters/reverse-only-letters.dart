class Solution {
  String reverseOnlyLetters(String s) {
    List<String> arr = s.split('');
    int left = 0, right = arr.length - 1;

    bool isLetter(String c) {
      return (c.codeUnitAt(0) >= 65 && c.codeUnitAt(0) <= 90) || 
             (c.codeUnitAt(0) >= 97 && c.codeUnitAt(0) <= 122);
    }

    while (left < right) {
      if (!isLetter(arr[left])) {
        left++;
      } else if (!isLetter(arr[right])) {
        right--;
      } else {
        // swap
        String temp = arr[left];
        arr[left] = arr[right];
        arr[right] = temp;

        left++;
        right--;
      }
    }

    return arr.join();
  }
}