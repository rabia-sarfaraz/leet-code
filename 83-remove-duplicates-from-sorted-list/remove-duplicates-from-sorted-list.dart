class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    ListNode? current = head;

    while (current != null && current.next != null) {
      if (current.val == current.next!.val) {
        // duplicate node ko skip karo
        current.next = current.next!.next;
      } else {
        // next node par move karo
        current = current.next;
      }
    }

    return head;
  }
}