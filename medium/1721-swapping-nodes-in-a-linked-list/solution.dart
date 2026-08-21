class Solution {
  ListNode? swapNodes(ListNode? head, int k) {
    ListNode? first = head;
    ListNode? second = head;

    // First node ko k-th position par le jao
    for (int i = 1; i < k; i++) {
      first = first!.next;
    }

    // First node ke saath ek pointer end tak le jao
    ListNode? temp = first;

    while (temp!.next != null) {
      temp = temp.next;
      second = second!.next;
    }

    // Values swap karo
    int value = first!.val;
    first.val = second!.val;
    second.val = value;

    return head;
  }
}