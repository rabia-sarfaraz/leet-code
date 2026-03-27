class Solution {
  List<String> fullJustify(List<String> words, int maxWidth) {
    List<String> result = [];
    int i = 0;

    while (i < words.length) {
      int j = i;
      int lineLength = 0;

      // find how many words fit in current line
      while (j < words.length &&
          lineLength + words[j].length + (j - i) <= maxWidth) {
        lineLength += words[j].length;
        j++;
      }

      int numWords = j - i;
      int totalSpaces = maxWidth - lineLength;

      StringBuffer line = StringBuffer();

      // last line OR single word → left justified
      if (j == words.length || numWords == 1) {
        for (int k = i; k < j; k++) {
          line.write(words[k]);
          if (k < j - 1) line.write(' ');
        }
        // fill remaining spaces
        int remaining = maxWidth - line.length;
        line.write(' ' * remaining);
      } else {
        int spaces = totalSpaces ~/ (numWords - 1);
        int extra = totalSpaces % (numWords - 1);

        for (int k = i; k < j; k++) {
          line.write(words[k]);
          if (k < j - 1) {
            line.write(' ' * (spaces + (extra > 0 ? 1 : 0)));
            if (extra > 0) extra--;
          }
        }
      }

      result.add(line.toString());
      i = j;
    }

    return result;
  }
}