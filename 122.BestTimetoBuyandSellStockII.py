# url exercise:https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/?envType=study-plan-v2&envId=top-interview-150
# Medium level

class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        start = prices[0]
        len_prices = len(prices)
        max_profit = 0

        for i in range(0, len_prices):
            if start < prices[i]:
                max_profit += prices[i]-start
            start = prices[i]
        return max_profit