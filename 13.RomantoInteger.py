# url exercise : https://leetcode.com/problems/roman-to-integer/description/

class Solution:
    def romanToInt(self, s: str) -> int:
        roman_numbers = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
        suma = 0
        copy = s
        if len(s) == 1:
            for key, value in roman_numbers.items():
                if s == key:
                    return value
        else:
            for i in range(len(s)):
                if s[i] in roman_numbers:
                    if "CM" in copy:
                        suma += 900
                        copy = copy.replace('CM', '')
                    elif "CD" in copy:
                        suma += 400
                        copy = copy.replace('CD', '')
                    elif "XL" in copy:
                        suma += 40
                        copy = copy.replace('XL', '')
                    elif "XC" in copy:
                        suma += 90
                        copy = copy.replace('XC', '')
                    elif "IV" in copy:
                        suma += 4
                        copy = copy.replace('IV', '')
                    elif "IX" in copy:
                        suma += 9
                        copy = copy.replace('IX', '')
            if copy:
                for j in copy:
                    suma += roman_numbers.get(j)      
            return suma