class Solution {
  int uniqueMorseRepresentations(List<String> words) {
    List<String> morse = [
      ".-","-...","-.-.","-..",".","..-.","--.",
      "....","..",".---","-.-",".-..","--","-.",
      "---",".--.","--.-",".-.","...","-",
      "..-","...-",".--","-..-","-.--","--.."
    ];

    Set<String> seen = {};

    for (String word in words) {
      String code = "";

      for (int i = 0; i < word.length; i++) {
        code += morse[word.codeUnitAt(i) - 97];
      }

      seen.add(code);
    }

    return seen.length;
  }
}