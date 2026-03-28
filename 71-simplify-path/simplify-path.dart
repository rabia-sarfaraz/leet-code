class Solution {
  String simplifyPath(String path) {
    List<String> stack = [];

    List<String> parts = path.split('/');

    for (String part in parts) {
      if (part.isEmpty || part == '.') {
        continue;
      } else if (part == '..') {
        if (stack.isNotEmpty) {
          stack.removeLast();
        }
      } else {
        stack.add(part);
      }
    }

    return '/' + stack.join('/');
  }
}