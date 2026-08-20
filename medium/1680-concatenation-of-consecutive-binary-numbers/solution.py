class Solution(object):
    def concatenatedBinary(self, n):
        MOD = 10**9 + 7
        result = 0

        for i in range(1, n + 1):
            bits = i.bit_length()

            result = ((result << bits) | i) % MOD

        return result