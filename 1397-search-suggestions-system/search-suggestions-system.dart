class Solution {
  List<List<String>> suggestedProducts(
      List<String> products, String searchWord) {
    
    products.sort();

    List<List<String>> result = [];
    String prefix = "";

    for (int i = 0; i < searchWord.length; i++) {
      prefix += searchWord[i];

      List<String> temp = [];

      for (String p in products) {
        if (p.startsWith(prefix)) {
          temp.add(p);
          if (temp.length == 3) break;
        }
      }

      result.add(temp);
    }

    return result;
  }
}