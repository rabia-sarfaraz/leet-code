class Solution {
  String sortString(String s) {
    List<int> freq = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      freq[s.codeUnitAt(i) - 97]++;
    }

    StringBuffer result = StringBuffer();

    while (result.length < s.length) {
      for (int i = 0; i < 26; i++) {
        if (freq[i] > 0) {
          result.writeCharCode(i + 97);
          freq[i]--;
        }
      }

      for (int i = 25; i >= 0; i--) {
        if (freq[i] > 0) {
          result.writeCharCode(i + 97);
          freq[i]--;
        }
      }
    }

    return result.toString();
  }
}