class Solution(object):

    def stoneGameVI(self, aliceValues, bobValues):
        stones = []

        for i in range(len(aliceValues)):
            stones.append((aliceValues[i] + bobValues[i], i))

        stones.sort(reverse=True)

        alice = 0
        bob = 0

        for turn, (_, i) in enumerate(stones):
            if turn % 2 == 0:
                alice += aliceValues[i]
            else:
                bob += bobValues[i]

        if alice > bob:
            return 1
        elif alice < bob:
            return -1
        else:
            return 0