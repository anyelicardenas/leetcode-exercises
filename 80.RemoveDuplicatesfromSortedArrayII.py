# exercise url:
# Medium level Python: O(1) extra memory.
class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        result = 0
        lastnum = None
        sortednums = sorted(nums)
        for current, nextn in zip(sortednums, sortednums[1:]):
            if current == nextn:
                if lastnum or lastnum == 0: 
                    if lastnum == current:
                        result += 1
                        nums.remove(current)
                    else: 
                        result = 0
                        lastnum = current
                else:
                    result = 1
                    lastnum = current
         
