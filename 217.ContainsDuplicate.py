# url exercise: https://leetcode.com/problems/contains-duplicate/
from collections import Counter

class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        num_counts = Counter(nums)
        for i in num_counts .values():
            if i != 1:
                return True