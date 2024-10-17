# url exercise:https://leetcode.com/problems/strobogrammatic-number/
# ""Given a string num which represents an integer, return true if num is a strobogrammatic number.

# A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down). ""

class Solution:
    def isStrobogrammatic(self, num: str) -> bool:
        non_strobogrammatic_number = [2,3,4,5,7]
        numbers = list(num)
        reverse_numbers = list(num[::-1])
        new_list = []
 
        for i in numbers:
            if i == '6':
                new_list.append('9')
            elif i == '9':
                new_list.append('6')
            elif int(i) in non_strobogrammatic_number:
                return False
            else: 
                new_list.append(i)

        return reverse_numbers == new_list