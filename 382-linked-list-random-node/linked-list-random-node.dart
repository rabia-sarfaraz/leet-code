import 'dart:math';

class Solution {
  ListNode? head;
  Random rand = Random();

  Solution(ListNode? head) {
    this.head = head;
  }
  
  int getRandom() {
    ListNode? curr = head;
    int result = 0;
    int i = 1;

    while (curr != null) {
      if (rand.nextInt(i) == 0) {
        result = curr.val;
      }
      curr = curr.next;
      i++;
    }

    return result;
  }
}