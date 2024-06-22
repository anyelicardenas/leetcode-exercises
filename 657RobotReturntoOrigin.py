# Simulation exercise url:https://leetcode.com/problems/robot-return-to-origin/submissions/1160207963/?envType=study-plan-v2&envId=programming-skills

class Solution:
    def judgeCircle(self, moves: str) -> bool:
        for i in moves:
            up = 'U'
            down = 'D'
            left = 'L'
            right = 'R'
            count_ud = moves.count('U') == moves.count('D')
            count_lr = moves.count('L') == moves.count('R')
            if (up in moves) and (down in moves):
                if count_ud == count_lr and count_ud:
                    return True
            elif (left in moves) and (right in moves):
                if count_ud == count_lr and count_lr:
                    return True
        return False
            