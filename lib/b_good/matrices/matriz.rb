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
	
	def maximo
		if @matriz.is_a? Array then 
			max = @matriz[0][0]
	      for i in 0...@dimension
	        for j in 0...@dimension
	          if @matriz[i][j] > max
	            max = @matriz[i][j]
	          end
	        end
	      end
	      max
	   elsif @matrix.is_a? Hash then
	   	max = @matrix[0][0]
	   	for i in @matrix.keys do
	   		for j in @matrix[i].keys do
	   			if @matrix[i][j] > max
	   				max = @matrix[i][j]
	   			end
	   		end
	   	end
	   	max
	   end
	end

	def minimo
		if @matriz.is_a? Array then
			min = @matriz[0][0]
		   for i in 0...@dimension
		     for j in 0...@dimension
		       if @matriz[i][j] < min
		         min = @matriz[i][j]
		       end
		     end
		   end
		   min
		elsif @matrix.is_a? Hash then
	   	min = @matrix[@matrix.keys.first][@matrix[@matrix.keys.first].keys.first]
	   	for i in @matrix.keys do
	   		for j in @matrix[i].keys do
	   			if @matrix[i][j] < min && @matrix[i][j] != 0 then
	   				min = @matrix[i][j]
	   			end
	   		end
	   	end
	   	min
	   end
	end

	def +(other)  #Para la suma de matrices

   end

   def -(other)  #Para la resta de matrices

   end

   def *(other)  #Para la multiplicacion de matrices

   end

	def [] (*ij)  #Recibe un numero de argumentos...
		
	end
end
