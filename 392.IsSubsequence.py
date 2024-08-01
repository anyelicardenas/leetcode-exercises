# https://leetcode.com/problems/is-subsequence/description/
class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        result = []
        iterator = 0
        for j in range(len(s)):
            counter = s.count(s[j])            
            for i in range(iterator, len(t)):
                if s[j] == t[i] and result.count(s[j]) < counter:
                    result.append(s[j])
                    iterator = i+ 1
                    break

        return result == list(s) 
      
            