class Solution(object):

    def boxDelivering(self, boxes, portsCount, maxBoxes, maxWeight):
        n = len(boxes)

        weight = [0] * (n + 1)
        changes = [0] * (n + 1)

        for i in range(1, n + 1):
            weight[i] = weight[i - 1] + boxes[i - 1][1]

            if i > 1:
                changes[i] = changes[i - 1] + (
                    boxes[i - 1][0] != boxes[i - 2][0]
                )

        dp = [0] * (n + 1)

        q = [0]
        head = 0

        for i in range(1, n + 1):

            while head < len(q) and (
                i - q[head] > maxBoxes
                or weight[i] - weight[q[head]] > maxWeight
            ):
                head += 1

            j = q[head]

            dp[i] = dp[j] + changes[i] - changes[j + 1] + 2

            if i < n:
                value = dp[i] - changes[i + 1]

                while head < len(q) and (
                    dp[q[-1]] - changes[q[-1] + 1] >= value
                ):
                    q.pop()

                q.append(i)

        return dp[n]