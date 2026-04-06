class Solution {
  int compress(List<String> chars) {
    int write = 0;
    int read = 0;

    while (read < chars.length) {
      String ch = chars[read];
      int start = read;

      while (read < chars.length && chars[read] == ch) {
        read++;
      }

      int count = read - start;

      chars[write++] = ch;

      if (count > 1) {
        for (String c in count.toString().split('')) {
          chars[write++] = c;
        }
      }
    }

    return write;
  }
}