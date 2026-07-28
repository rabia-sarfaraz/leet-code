class Solution {
  String smallestPalindrome(String s) {
    List<int> freq = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      freq[s.codeUnitAt(i) - 97]++;
    }

    StringBuffer left = StringBuffer();
    String mid = "";

    for (int i = 0; i < 26; i++) {
      for (int j = 0; j < freq[i] ~/ 2; j++) {
        left.writeCharCode(i + 97);
      }
      if (freq[i].isOdd) {
        mid = String.fromCharCode(i + 97);
      }
    }

    String firstHalf = left.toString();
    String secondHalf = firstHalf.split('').reversed.join();

    return firstHalf + mid + secondHalf;
  }
}