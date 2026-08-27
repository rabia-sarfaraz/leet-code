class Solution(object):
    def areSentencesSimilar(self, sentence1, sentence2):
        """
        :type sentence1: str
        :type sentence2: str
        :rtype: bool
        """

        a = sentence1.split()
        b = sentence2.split()

        # Make a the shorter sentence
        if len(a) > len(b):
            a, b = b, a

        n = len(a)

        # Common prefix
        left = 0
        while left < n and a[left] == b[left]:
            left += 1

        # Common suffix
        right = 0
        while right < n - left and a[n - 1 - right] == b[len(b) - 1 - right]:
            right += 1

        return left + right >= n