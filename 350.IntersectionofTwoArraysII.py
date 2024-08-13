# url exercise:https://leetcode.com/problems/intersection-of-two-arrays-ii/
class Solution:
    def intersect(self, nums1: List[int], nums2: List[int]) -> List[int]:
        result = []
        array_max = None
        array_min = None
        if len(nums1) > len(nums2):
            array_max = nums1
            array_min = nums2
        elif  len(nums1) == len(nums2):
            array_max = nums1
            array_min = nums2
        else:
            array_max = nums2
            array_min = nums1

        for i in array_min:
            if i in array_max:
                result.append(i)
                array_max.remove(i)
        return result
