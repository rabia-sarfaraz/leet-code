class Solution {
  String toGoatLatin(String sentence) {
    Set<String> vowels = {'a', 'e', 'i', 'o', 'u',
                          'A', 'E', 'I', 'O', 'U'};

    List<String> words = sentence.split(' ');
    List<String> result = [];

    for (int i = 0; i < words.length; i++) {
      String word = words[i];

      String converted;

      if (vowels.contains(word[0])) {
        converted = word + "ma";
      } else {
        converted = word.substring(1) + word[0] + "ma";
      }

      converted += "a" * (i + 1);

      result.add(converted);
    }

    return result.join(' ');
  }
}