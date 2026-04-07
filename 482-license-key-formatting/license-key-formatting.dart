class Solution {
  String licenseKeyFormatting(String s, int k) {
    String cleaned = s.replaceAll('-', '').toUpperCase();

    StringBuffer sb = StringBuffer();
    int count = 0;

    for (int i = cleaned.length - 1; i >= 0; i--) {
      sb.write(cleaned[i]);
      count++;

      if (count == k && i != 0) {
        sb.write('-');
        count = 0;
      }
    }

    return sb.toString().split('').reversed.join('');
  }
}