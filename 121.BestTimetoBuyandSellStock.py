# url exercise:https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/

class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        profit = 0
        list_of_profits = []
        lower_purchase = None
        first_lower_purchase = None
        if len(prices) ==1:
            return 0
        elif all(num == prices[0] for num in prices):
            return 0
        for index, i in enumerate(prices):
            if i == prices[0]:
                buy = i
                lower_purchase = i
                if first_lower_purchase or first_lower_purchase==0 :
                    if first_lower_purchase < lower_purchase :
                        lower_purchase = first_lower_purchase
                        list_of_profits.append(i-lower_purchase)
                elif index == len(prices) - 1:
                    list_of_profits.append(i)
            elif index == len(prices) - 1:
                last_profit = i-lower_purchase
                if last_profit >= 0:
                    list_of_profits.append(i-lower_purchase)
            else:
                if i <= lower_purchase:
                    lower_purchase = i
                    first_lower_purchase = i
                    profit = i - buy
                    if profit <= 0:
                        buy = i
                else:
                    profit = i-lower_purchase
                    list_of_profits.append(profit)
                    buy = i
        
        if list_of_profits:
            return max(list_of_profits)
        else:
            return 0