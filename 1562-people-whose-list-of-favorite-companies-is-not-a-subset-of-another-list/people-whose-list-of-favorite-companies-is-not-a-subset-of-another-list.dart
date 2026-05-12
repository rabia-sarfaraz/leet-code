class Solution {
  List<int> peopleIndexes(List<List<String>> favoriteCompanies) {
    int n = favoriteCompanies.length;

    List<Set<String>> sets = favoriteCompanies
        .map((companies) => companies.toSet())
        .toList();

    List<int> result = [];

    for (int i = 0; i < n; i++) {
      bool isSubset = false;

      for (int j = 0; j < n; j++) {
        if (i == j) continue;

        if (sets[j].length < sets[i].length) continue;

        bool allFound = true;

        for (String company in sets[i]) {
          if (!sets[j].contains(company)) {
            allFound = false;
            break;
          }
        }

        if (allFound) {
          isSubset = true;
          break;
        }
      }

      if (!isSubset) {
        result.add(i);
      }
    }

    return result;
  }
}