# url exercise: https://leetcode.com/problems/reverse-words-in-a-string/?envType=study-plan-v2&envId=top-interview-150
class Solution:
    def reverseWords(self, s: str) -> str:
        list_string = s.split()
        reverse_string = list_string[::-1]
        result = ""
        
        for i in reverse_string:
            result += str(i)
            result += ' '

        return result[:-1]