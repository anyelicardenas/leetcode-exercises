# url exercise:https://leetcode.com/problems/pascals-triangle/description/

class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        resultado = [[1], [1,1], [1, 2, 1]] 
        if numRows == 1:
            return [[1]]
        elif numRows == 2:
            return [[1], [1,1]]
        
        esquinas = [1, 1]
        piso_tres_triangulo = [1, 2, 1]
        while len(resultado) != numRows:
            if numRows == 3:
                return resultado
            for actual, siguiente in zip(piso_tres_triangulo, piso_tres_triangulo[1:]):
                suma = actual + siguiente
                esquinas.insert(1, suma)
                if len(esquinas) > len(piso_tres_triangulo):
                    resultado.append(esquinas)
                    piso_tres_triangulo = esquinas
                    esquinas = [1,1]
            
        return resultado