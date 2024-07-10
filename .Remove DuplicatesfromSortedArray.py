# url exercise: https://leetcode.com/problems/remove-duplicates-from-sorted-array/

class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        copy = nums.copy()
        for i in copy:
            if nums.count(i) >= 2:
                while nums.count(i) != 1:
                    nums.remove(i)
           