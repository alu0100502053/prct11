class Matriz
	def initialize(*args)  #args recogerá en un array las filas de nuestra matriz.
		@matriz = Array.new()
		for i in args do  
			if i.size == args.size then  #controlamos que es una matriz cuadrada.
				@matriz.push(i)
			else
				raise "La matriz debe ser cuadrada"
			end
		end
		@dimension = args.size  #Guardamos en una variable de instancia la dimension de la matriz.
	end

	def +(other)  #Para la suma de matrices
		matriz3 = Array.new(@dimension) {|i|   #creamos un array de arrays, de dimension @dimension, y cuya contenido en la posicion[i][j] será el resultado del bloque.
    		Array.new(@dimension) {|j|
      		@matriz[i][j] + other[i][j]
    		}
    	}
   end

   def -(other)  #Para la resta de matrices
		matriz3 = Array.new(@dimension) {|i|   #creamos un array de arrays, de dimension @dimension, y cuya contenido en la posicion[i][j] será el resultado del bloque.
    		Array.new(@dimension) {|j|
      		@matriz[i][j] - other[i][j]
    		}
    	}
   end

   def *(other)  #Para la multiplicacion de matrices
   	matriz3 = Array.new(@dimension) {|i|   #creamos un array de arrays, de dimension @dimension, y cuya contenido en la posicion[i][j] será el resultado del bloque.
   		Array.new(@dimension) {|j|
   			(0...@dimension).inject(0) do |resultado, k|  #El inject(0) inicializa a 0 el primer argumento (resultado).
          		resultado + @matriz[i][k] * other[k][j]   #Operacion para realizar la multiplicacion de matrices.
        		end
   		}
   	}
   end

	def [] (*ij)  #Recibe un numero de argumentos...
		return @matriz[*ij] if ij.size == 1  #si el numero de argumentos es solo 1, entonces devolvemos toda la fila indicada.
	   @matriz[ij.first][ij.last]  #si son 2, devuelveme el elemento indicado.
	end
end
