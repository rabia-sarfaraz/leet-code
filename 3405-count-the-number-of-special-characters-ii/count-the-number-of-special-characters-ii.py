class Solution(object):
    def numberOfSpecialChars(self, word):
        first_upper = {}
        last_lower = {}

        for i, ch in enumerate(word):
            if ch.isupper():
                c = ch.lower()
                if c not in first_upper:
                    first_upper[c] = i
            else:
                last_lower[ch] = i

        count = 0

        for c in "abcdefghijklmnopqrstuvwxyz":
            if c in first_upper and c in last_lower:
                if last_lower[c] < first_upper[c]:
                    count += 1

        return count