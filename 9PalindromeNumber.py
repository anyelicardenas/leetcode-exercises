# url: https://leetcode.com/problems/palindrome-number/
class Solution:
    def isPalindrome(self, x: int) -> bool:
        string = str(x)
        l = string[::-1]
        return l == str(x)