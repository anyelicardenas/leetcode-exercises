# url exercise:https://leetcode.com/problems/meeting-rooms/
from collections import Counter
class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        intervals_sorted = sorted(intervals)
        counter = 0
        for current, nextn in zip(intervals_sorted, intervals_sorted[1:]):
            if current[1] <= nextn[0]:
                counter += 1
        return counter == len(intervals)-1 or intervals  == []