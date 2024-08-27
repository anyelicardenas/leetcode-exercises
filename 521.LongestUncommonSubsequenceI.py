# url exercise:https://leetcode.com/problems/longest-uncommon-subsequence-i/
class Solution:
    def findLUSlength(self, a: str, b: str) -> int:
        longest_string = a if len(a) > len(b) else b
        if a == b:
            return -1
        else:
            return len(longest_string)
