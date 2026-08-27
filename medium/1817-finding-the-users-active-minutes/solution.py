class Solution(object):
    def findingUsersActiveMinutes(self, logs, k):
        """
        :type logs: List[List[int]]
        :type k: int
        :rtype: List[int]
        """

        users = {}

        for user_id, minute in logs:
            if user_id not in users:
                users[user_id] = set()

            users[user_id].add(minute)

        answer = [0] * k

        for minutes in users.values():
            uam = len(minutes)

            if 1 <= uam <= k:
                answer[uam - 1] += 1

        return answer