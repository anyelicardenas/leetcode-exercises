# url exercise:https://leetcode.com/problems/missing-number/submissions/1359646210/
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        n = max(nums)
        all_nums_list =  list(range(0, n+1))
        for i in all_nums_list:
            if i not in nums:
                return i
        
        return max(nums) +1
