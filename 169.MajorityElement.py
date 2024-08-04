# url exercise:https://leetcode.com/problems/majority-element/

from collections import Counter

class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        counter = Counter(nums)
        majority_element= max(counter.values())
        for key, value in counter.items():
            if majority_element == value:
                return key
     