class Solution {
  ListNode? swapPairs(ListNode? head) {
    ListNode dummy = ListNode(0, head);
    ListNode? current = dummy;

    while (current?.next != null && current?.next?.next != null) {
      ListNode first = current!.next!;
      ListNode second = current.next!.next!;

      // Swapping
      first.next = second.next;
      second.next = first;
      current.next = second;

      // Move to next pair
      current = first;
    }

    return dummy.next;
  }
}