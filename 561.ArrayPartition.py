# url exercise: https://leetcode.com/problems/array-partition/description/
class Solution:
    def arrayPairSum(self, nums: List[int]) -> int:
        nums_sorted_desc= sorted(nums, reverse = True)
        result = []
        for i in range(0, len(nums_sorted_desc ), 2):
            min_of_pairing = min(nums_sorted_desc[i], nums_sorted_desc [i+1])
            result.append(min_of_pairing)
        return sum(result)
