class Solution:
    def reverseWords(self, s: str) -> str:
        separate_words_in_list = s.split()
        result = ""
        for i in separate_words_in_list:
            reverse_word = i[::-1]
            result += " "
            result += reverse_word
        print(result.lstrip())
        return result.lstrip()