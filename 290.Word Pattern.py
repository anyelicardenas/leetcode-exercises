# url exercise:https://leetcode.com/problems/word-pattern/description/
from collections import Counter
class Solution:
    def wordPattern(self, pattern: str, s: str) -> bool:
        pattern_counter = Counter(pattern)
        words = s.split()
        word_counter = Counter(words)
        pattern_indices = []
        word_indices = []

        for i in range(len(pattern)):
            if pattern[i] in pattern_counter:
                pattern_indices.append(pattern.index(pattern[i]))
            
        for i in range(len(words)):
            if words[i] in word_counter:
                word_indices.append(words.index(words[i]))

        return pattern_indices == word_indices

            