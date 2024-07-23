# url exercise:https://leetcode.com/problems/pascals-triangle/description/

class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        resultado = [[1], [1,1], [1, 2, 1]] 
        if numRows == 1:
            return [[1]]
        elif numRows == 2:
            return [[1], [1,1]]
        elif numRows == 3:
            return resultado
        
        prueba = [1, 1]
        iterar = [1, 2, 1]
        while len(resultado) != numRows:
            for actual, siguiente in zip(iterar, iterar[1:]):
                suma = actual + siguiente
                prueba.insert(1, suma)
                if len(prueba) > len(iterar):
                    resultado.append(prueba)
                    iterar = prueba
                    prueba = [1,1]
            
        return resultado