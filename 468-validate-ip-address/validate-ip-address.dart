class Solution {
  String validIPAddress(String queryIP) {
    if (isIPv4(queryIP)) return "IPv4";
    if (isIPv6(queryIP)) return "IPv6";
    return "Neither";
  }

  bool isIPv4(String ip) {
    if (ip.contains(':')) return false;

    List<String> parts = ip.split('.');
    if (parts.length != 4) return false;

    for (String part in parts) {
      if (part.isEmpty) return false;

      // no leading zeros allowed (except "0")
      if (part.length > 1 && part[0] == '0') return false;

      int? num = int.tryParse(part);
      if (num == null) return false;

      if (num < 0 || num > 255) return false;
    }

    return true;
  }

  bool isIPv6(String ip) {
    if (ip.contains('.')) return false;

    List<String> parts = ip.split(':');
    if (parts.length != 8) return false;

    String hexChars = "0123456789abcdefABCDEF";

    for (String part in parts) {
      if (part.isEmpty || part.length > 4) return false;

      for (int i = 0; i < part.length; i++) {
        if (!hexChars.contains(part[i])) return false;
      }
    }

    return true;
  }
}