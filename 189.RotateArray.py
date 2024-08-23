# url exercise:https://leetcode.com/problems/rotate-array/?envType=study-plan-v2&envId=top-interview-150
# Medium level Python
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        k = k % len(nums) if k > len(nums) else k
        index = 0
        index_k = len(nums)-k

        for i in range(len(nums)): 
            if index < k:
                nums.insert(index, nums[index_k])
                nums.pop(index_k+1)
                index += 1
                index_k += 1
