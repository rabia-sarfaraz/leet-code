import 'dart:collection';

class Solution {
  List<int> deckRevealedIncreasing(List<int> deck) {
    deck.sort();
    Queue<int> q = Queue();

    for (int i = deck.length - 1; i >= 0; i--) {
      if (q.isNotEmpty) {
        // last ko front pe le ao
        q.addFirst(q.removeLast());
      }
      // current card front pe
      q.addFirst(deck[i]);
    }

    return q.toList();
  }
}