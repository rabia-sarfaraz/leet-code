class Solution {
  String arrangeWords(String text) {
    List<String> words = text.toLowerCase().split(' ');

    List<List<dynamic>> arr = [];

    for (int i = 0; i < words.length; i++) {
      arr.add([words[i], i]);
    }

    arr.sort((a, b) {
      String w1 = a[0];
      String w2 = b[0];

      if (w1.length == w2.length) {
        return a[1].compareTo(b[1]); // preserve original order
      }

      return w1.length.compareTo(w2.length);
    });

    List<String> resultWords = [];

    for (var item in arr) {
      resultWords.add(item[0]);
    }

    String result = resultWords.join(' ');

    return result[0].toUpperCase() + result.substring(1);
  }
}