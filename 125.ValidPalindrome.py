# url exercise:https://leetcode.com/problems/valid-palindrome/description/
class Solution:
    def isPalindrome(self, s: str) -> bool:
        convert_to_lower = s.lower()
        convert_to_lower = convert_to_lower.replace(",", "")
        convert_to_lower = convert_to_lower.replace(";", "")
        convert_to_lower = convert_to_lower.replace("!", "")
        convert_to_lower = convert_to_lower.replace("'", "")
        convert_to_lower = convert_to_lower.replace("\"", "")
        convert_to_lower = convert_to_lower.replace("-", "")
        convert_to_lower = convert_to_lower.replace("?", "")
        convert_to_lower = convert_to_lower.replace(".", "")
        convert_to_lower = convert_to_lower.replace("`", "")
        convert_to_lower = convert_to_lower.replace("{", "")
        convert_to_lower = convert_to_lower.replace("}", "")
        convert_to_lower = convert_to_lower.replace("[", "")
        convert_to_lower = convert_to_lower.replace("]", "")
        convert_to_lower = convert_to_lower.replace("(", "")
        convert_to_lower = convert_to_lower.replace(")", "")
        convert_to_lower = convert_to_lower.replace("_", "")
        convert_to_lower = convert_to_lower.replace("/", "")
        convert_to_lower = convert_to_lower.replace("@", "")
        convert_to_lower = convert_to_lower.replace("#", "")
        convert_to_lower = convert_to_lower.replace(":", "")
        convert_to_lower = convert_to_lower.replace(" ", "")
        return convert_to_lower == convert_to_lower[::-1]