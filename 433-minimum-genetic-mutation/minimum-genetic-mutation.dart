import 'dart:collection';

class Solution {
  int minMutation(String startGene, String endGene, List<String> bank) {
    Set<String> bankSet = bank.toSet();

    if (!bankSet.contains(endGene)) return -1;

    List<String> choices = ['A', 'C', 'G', 'T'];

    Queue<String> q = Queue();
    q.add(startGene);

    Set<String> visited = {startGene};

    int steps = 0;

    while (q.isNotEmpty) {
      int size = q.length;

      for (int i = 0; i < size; i++) {
        String curr = q.removeFirst();

        if (curr == endGene) return steps;

        List<String> chars = curr.split('');

        for (int j = 0; j < 8; j++) {
          String original = chars[j];

          for (String c in choices) {
            if (c == original) continue;

            chars[j] = c;
            String newGene = chars.join('');

            if (bankSet.contains(newGene) && !visited.contains(newGene)) {
              visited.add(newGene);
              q.add(newGene);
            }
          }

          chars[j] = original;
        }
      }

      steps++;
    }

    return -1;
  }
}