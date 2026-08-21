class Solution {
  String maximumBinaryString(String binary) {
    int firstZero = binary.indexOf('0');

    // Agar zero nahi hai
    if (firstZero == -1) {
      return binary;
    }

    int zeroCount = 0;

    for (int i = firstZero; i < binary.length; i++) {
      if (binary[i] == '0') {
        zeroCount++;
      }
    }

    int zeroPosition = firstZero + zeroCount - 1;

    StringBuffer ans = StringBuffer();

    for (int i = 0; i < binary.length; i++) {
      if (i == zeroPosition) {
        ans.write('0');
      } else {
        ans.write('1');
      }
    }

    return ans.toString();
  }
}