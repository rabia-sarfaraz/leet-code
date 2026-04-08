class Solution {
  List<String> removeComments(List<String> source) {
    List<String> result = [];
    StringBuffer buffer = StringBuffer();
    bool inBlock = false;

    for (String line in source) {
      int i = 0;

      while (i < line.length) {
        if (inBlock) {
          if (i + 1 < line.length && line[i] == '*' && line[i + 1] == '/') {
            inBlock = false;
            i += 2;
          } else {
            i++;
          }
        } else {
          if (i + 1 < line.length && line[i] == '/' && line[i + 1] == '*') {
            inBlock = true;
            i += 2;
          } else if (i + 1 < line.length && line[i] == '/' && line[i + 1] == '/') {
            break; // ignore rest of line
          } else {
            buffer.write(line[i]);
            i++;
          }
        }
      }

      if (!inBlock && buffer.isNotEmpty) {
        result.add(buffer.toString());
        buffer.clear();
      }
    }

    return result;
  }
}