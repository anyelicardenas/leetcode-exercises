# url execise: https://leetcode.com/problems/valid-sudoku/
# Medium level
from collections import Counter
class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        index = 0
        col_board = []
        rows_board = []
        while index < len(board):
            for lists in board:
                if lists[index] != ".":
                    if lists[index] in col_board:
                        return False
                    else:
                        col_board.append(lists[index])
            index += 1
            col_board = []

        for x in board:
            counter_rows = Counter(x)
            for r in counter_rows.items():
                if r[0] != ".":
                    rows_board.append(r[1])
        
        for i in range(0, len(board), 3): 
            for j in range(0, len(board), 3):
                subgrid = []
                for x in range(3):
                    for y in range(3):
                        value = board[i + x][j + y]
                        if value != ".":
                            subgrid.append(value)
                
                if len(subgrid) != len(set(subgrid)):
                    return False

        for i in rows_board:
            if i != 1:
                return False
        return True
       