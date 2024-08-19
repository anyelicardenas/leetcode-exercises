# url exercise: https://leetcode.com/problems/reverse-vowels-of-a-string/
class Solution:
    def reverseVowels(self, s: str) -> str:
        reversed_vowels = ""
        final_string = ""
        vowels = "aeiouAEIOU"
        vowel_index = 0

        for char in s[::-1]:
            if char in vowels:
                reversed_vowels += char 

        for char in s:
            if char not in vowels:
                final_string += char
            else:
                final_string += reversed_vowels[vowel_index]
                if vowel_index < len(reversed_vowels):
                    vowel_index += 1

        return final_string