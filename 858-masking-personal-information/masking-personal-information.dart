class Solution {
  String maskPII(String s) {
    // Email case
    if (s.contains('@')) {
      s = s.toLowerCase();
      List<String> parts = s.split('@');
      String name = parts[0];
      String domain = parts[1];

      return name[0] + "*****" + name[name.length - 1] + "@" + domain;
    }

    // Phone case
    String digits = "";
    for (int i = 0; i < s.length; i++) {
      if (s.codeUnitAt(i) >= 48 && s.codeUnitAt(i) <= 57) {
        digits += s[i];
      }
    }

    String local = "***-***-" + digits.substring(digits.length - 4);
    int countryLen = digits.length - 10;

    if (countryLen == 0) return local;

    return "+" + "*" * countryLen + "-" + local;
  }
}