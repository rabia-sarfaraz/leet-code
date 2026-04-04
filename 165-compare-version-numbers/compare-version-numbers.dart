class Solution {
  int compareVersion(String version1, String version2) {
    List<String> v1 = version1.split('.');
    List<String> v2 = version2.split('.');

    int n = v1.length > v2.length ? v1.length : v2.length;

    for (int i = 0; i < n; i++) {
      int num1 = i < v1.length ? int.parse(v1[i]) : 0;
      int num2 = i < v2.length ? int.parse(v2[i]) : 0;

      if (num1 > num2) return 1;
      if (num1 < num2) return -1;
    }

    return 0;
  }
}