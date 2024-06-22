# URL del ejercicio: https://leetcode.com/problems/longest-common-prefix/

class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        prefix = ""

        for i in range(len(strs[0])):
            for x in strs:
                if (i == len(x)) or  (x[i] != strs[0][i]):
                        return prefix
            prefix += strs[0][i]
        return prefix
