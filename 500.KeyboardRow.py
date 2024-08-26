# url exercise:https://leetcode.com/problems/keyboard-row/description/
class Solution:
    def findWords(self, words: List[str]) -> List[str]:
        top_row_chars = "qwertyuiopQWERTYUIOP"
        middle_row_chars = "asdfghjklASDFGHJKL"
        bottom_row_chars = "zxcvbnmZXCVBNM"
        validated_word = ""
        words_to_remove = []

        for word in words:
            top_row_indicator = ""
            middle_row_indicator = ""
            bottom_row_indicator = ""
            
            for char in word:
                if char in top_row_chars:
                    validated_word += char
                    top_row_indicator = "top row"
                    if middle_row_indicator != "" or bottom_row_indicator != "":
                        words_to_remove.append(word)
                        continue
                elif char in middle_row_chars:
                    validated_word += char
                    middle_row_indicator = "middle row"
                    if top_row_indicator != "" or bottom_row_indicator != "":
                        words_to_remove.append(word)
                        continue
                else:
                    validated_word += char
                    bottom_row_indicator = "bottom row"
                    if top_row_indicator != "" or middle_row_indicator != "":
                        words_to_remove.append(word)
                        continue
                        
        words_removed = list(set(words_to_remove))

        for removed_word in words_removed:
            if removed_word in words:
                words.remove(removed_word)
            
        return words