# url exercise:https://leetcode.com/problems/climbing-stairs/description/
# "Staircase Problem" Solution achieved using a recursive function
class Solution:
    def climbStairs(self, n: int) -> int:
        if n == 0 or n == 1:
            return 1
        return self.climbStairs(n-1) + self.climbStairs(n-2)
       