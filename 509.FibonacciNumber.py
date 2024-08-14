# url exercise:https://leetcode.com/problems/fibonacci-number/description/
class Solution:
    def fib(self, n: int) -> int:
        current_index = 2
        sum_fib = 0
        result = 0
        prev_fib1 = 1
        prev_fib2 = 0
        
        if n == 0:
            return 0
        elif n == 1:
            return 1
            
        while current_index <= n:
            sum_fib = prev_fib1 + prev_fib2
            prev_fib2 = prev_fib1
            prev_fib1 = sum_fib
            result = sum_fib
            current_index += 1

        return result