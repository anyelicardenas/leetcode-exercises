"""
Given an array of strings wordsDict and two different strings 
that already exist in the array word1 and word2, 
return the shortest distance between these two words in the list.

Example 1:

Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], 
word1 = "coding", 
word2 = "practice"
Output: 3

Example 2:
Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], 
word1 = "makes", 
word2 = "coding"
Output: 1
 
Constraints:
2 <= wordsDict.length <= 3 * 104
1 <= wordsDict[i].length <= 10
wordsDict[i] consists of lowercase English letters.
word1 and word2 are in wordsDict.
word1 != word2
"""

class Solution:
    def shortestDistance(self, wordsDict: List[str], word1: str, word2: str) -> int:
        index1, index2, distance = [], [], []
        max_list, min_list = None, None

        for i in range(len(wordsDict)):
            if wordsDict[i] == word1:
                index1.append(i)
            elif wordsDict[i] == word2:
                index2.append(i)

        max_list = max(len(index1), len(index2))
        
        if len(index1) == max_list:
            max_list = index1
            min_list = index2
        else:
            max_list = index2
            min_list = index1
        
        for i in max_list:
            for j in min_list:
                distance.append(abs(i-j))

        return min(distance)