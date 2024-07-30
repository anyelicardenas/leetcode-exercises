## url exercise: https://leetcode.com/problems/isomorphic-strings/

class Solution:
    def isIsomorphic(self, s: str, t: str) -> bool:
        s_list = []
        t_list = []
        indexes_s = []
        indexes_t = []
        for i in range(len(s)):
            count_s = s.count(s[i])
            s_list.append(count_s)

            if s[i] != s[i-1]:
                indexes_s.append(i)

        for i in range(len(t)):
            count_t = t.count(t[i])
            t_list.append(count_t)

            if t[i] != t[i-1]:
                indexes_t.append(i)
                
        return s_list == t_list and indexes_s == indexes_t