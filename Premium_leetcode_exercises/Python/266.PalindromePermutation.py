# 266. Palindrome Permutation
"""
Given a string s, return true if a permutation of the string could form a 
palindrome
 and false otherwise.

Example 1:
Input: s = "code"
Output: false

Constraints:

1 <= s.length <= 5000
s consists of only lowercase English letters.
"""

from collections import Counter

class Solution:
    def canPermutePalindrome(self, s: str) -> bool:
        len_string = len(s)
        counter = Counter(s)
        even_values = []
        odd_values = []
        if len_string % 2 == 0:
            for key, value in counter.items():
                if value % 2 != 0:
                    return False
                else:
                    even_values.append(value)
            return sum(even_values) == len_string
        else:
            for key, value in counter.items():
                if value % 2 != 0:
                    odd_values.append(1)
                elif value >= 2 and len(counter) == 1:
                    return True
            return sum(odd_values) == 1
        