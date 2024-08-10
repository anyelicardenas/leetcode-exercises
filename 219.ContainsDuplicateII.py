# url exercise:https://leetcode.com/problems/contains-duplicate-ii/description/
class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        index_map = {}
        for index, num in enumerate(nums):
            if num in index_map and index - index_map[num] <= k:
                return True
            index_map[num] = index
        return False