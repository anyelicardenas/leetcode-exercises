# url exercise: https://leetcode.com/problems/search-insert-position/

class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        if target > max(nums):
            nums.append(target) 
        for x in range(len(nums)):
            if target > nums[x] and target < nums[x+1]:
                index_max = nums.index(nums[x+1])
                nums.insert(index_max, target)
            elif target < min(nums):
                index_min = nums.index(min(nums))
                nums.insert(index_min, target)

        for i in range(len(nums)):
            if target == nums[i]:
                return i

        