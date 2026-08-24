class Solution(object):
    def numDifferentIntegers(self, word):
        """
        :type word: str
        :rtype: int
        """
        nums = set()
        i = 0

        while i < len(word):
            if word[i].isdigit():
                j = i

                while j < len(word) and word[j].isdigit():
                    j += 1

                # Remove leading zeros
                num = word[i:j].lstrip('0')

                # "000" should represent 0
                if num == "":
                    num = "0"

                nums.add(num)
                i = j
            else:
                i += 1

        return len(nums)