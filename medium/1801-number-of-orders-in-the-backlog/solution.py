class Solution(object):
    def getNumberOfBacklogOrders(self, orders):
        """
        :type orders: List[List[int]]
        :rtype: int
        """
        import heapq

        buy = []   # (-price, amount)
        sell = []  # (price, amount)

        MOD = 10**9 + 7

        for price, amount, orderType in orders:

            if orderType == 0:  # Buy
                while amount > 0 and sell and sell[0][0] <= price:
                    sellPrice, sellAmount = heapq.heappop(sell)

                    used = min(amount, sellAmount)

                    amount -= used
                    sellAmount -= used

                    if sellAmount > 0:
                        heapq.heappush(
                            sell, (sellPrice, sellAmount)
                        )

                if amount > 0:
                    heapq.heappush(buy, (-price, amount))

            else:  # Sell
                while amount > 0 and buy and -buy[0][0] >= price:
                    buyPrice, buyAmount = heapq.heappop(buy)

                    used = min(amount, buyAmount)

                    amount -= used
                    buyAmount -= used

                    if buyAmount > 0:
                        heapq.heappush(
                            buy, (buyPrice, buyAmount)
                        )

                if amount > 0:
                    heapq.heappush(sell, (price, amount))

        answer = 0

        for price, amount in buy:
            answer = (answer + amount) % MOD

        for price, amount in sell:
            answer = (answer + amount) % MOD

        return answer