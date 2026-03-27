class Solution {
  ListNode? rotateRight(ListNode? head, int k) {
    if (head == null || head.next == null || k == 0) return head;

    // Step 1: find length and tail
    ListNode? temp = head;
    int length = 1;

    while (temp!.next != null) {
      temp = temp.next;
      length++;
    }

    // Step 2: make circular
    temp.next = head;

    // Step 3: effective rotations
    k = k % length;
    int stepsToNewHead = length - k;

    // Step 4: move to new tail
    ListNode? newTail = head;
    for (int i = 1; i < stepsToNewHead; i++) {
      newTail = newTail!.next;
    }

    // Step 5: set new head
    ListNode? newHead = newTail!.next;

    // break the circle
    newTail.next = null;

    return newHead;
  }
}