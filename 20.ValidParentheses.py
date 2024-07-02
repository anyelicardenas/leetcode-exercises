# url: https://leetcode.com/problems/valid-parentheses/description/
# Using Data Structure: Stack

class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        stack_copy = []
        last_bracket = ""
        for i in range(len(s)):
            if s[i] == "(" or s[i] == "[" or s[i] == "{":
                stack.append(s[i])
                last_bracket = s[i]
            else:
                stack_copy.append(s[i])
                if stack and i != len(s)-1:
                    if s[i] == ")" and last_bracket =="(":
                        stack.pop()
                        stack_copy.pop()
                        if stack:
                            last_bracket = stack[-1]
                    elif s[i] == "]" and last_bracket == "[":
                        stack.pop()
                        stack_copy.pop()
                        if stack:
                            last_bracket = stack[-1]
                    elif s[i] == "}" and last_bracket == "{":
                        stack.pop()
                        stack_copy.pop()
                        if stack:
                            last_bracket = stack[-1]
                    else:
                        return False
                elif stack and i == len(s)-1:
                    if stack[0] == "(" and s[i] ==")":
                        stack.pop()
                        stack_copy.pop()
                    elif stack[0] == "[" and s[i] =="]":
                        stack.pop()
                        stack_copy.pop()
                    elif stack[0] == "{" and s[i] =="}":
                        stack.pop()
                        stack_copy.pop()
        if stack ==[] and stack_copy ==[]:
            return True
       