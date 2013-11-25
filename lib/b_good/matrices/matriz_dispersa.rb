class Vector_disperso
  attr_reader :vector

  #definicion del initialize para crear los hash
	def initialize(h = {})
    @vector = Hash.new(0)
    @vector = @vector.merge!(h)
  end

  #definicion del metodo to_s para vector
  def to_s
    @vector.to_s
  end

  #definicion del metodo keys para vector
 	def keys
 		@vector.keys
 	end

  #definicion del hash vector
  def hash
    @vector
  end

  #definicion del metodo suma de matrices dispersas
  def +(other)
    @vector.merge!(other.hash){|key, oldval, newval| newval + oldval}
  end

  #definicion del metodo resta de matrices dispersas
  def -(other)
    @vector.merge!(other.hash){|key, oldval, newval| newval - oldval}
  end

  #definicion del metodo getter con dos argumento
 	def []= (i,v)
 		@vector[i] = v
 	end

  #definicion del metodo getter con un argumento
	def [](i)
    	@vector[i] 
  end
end

class Matriz_dispersa < Matriz
	
	attr_reader :matrix
  #definicion del initialize vector_disperso
	def initialize(h = {})
   	@matrix = Hash.new(0)
  	for k in h.keys do 
    	@matrix[k] = 	if h[k].is_a? Vector_disperso
       						h[k]
          				else 
                   		@matrix[k] = Vector_disperso.new(h[k])
                 	end
  	end
  end

  #definicion del metodo getter con un argumento
	def [](i)
		@matrix[i]
	end

  #definicion del hash matrix
  def hash
    @matrix
  end

  #definicion del metodo keys para matrix
	def keys
		@matrix.keys
	end

  #definicion del metodo para obtener un vector con las columnas de la matriz
	def col(j)
  	c = {}
  	for r in @matrix.keys do
    	c[r] = @matrix[r].vector[j] if @matrix[r].vector.keys.include? j
  	end
  	Vector_disperso.new c
	end

  #definicion del metodo para la suma de matrices
  def +(other)  
    ms = @matrix.clone
    ms.merge!(other.hash){ |key, oldval, newval| newval + oldval}
  end

  #definicion del metodo para la resta de matrices
  def -(other)  
    ms = @matrix.clone
    ms.merge!(other.hash){ |key, oldval, newval| newval - oldval}
  end

  #definicion del metodo para la multiplicacion de matrices
  def *(other) 
      ms = Hash.new(0)
      h = Hash.new(0)
      @mul = 0
      @matrix.keys.count.times do |k|
      @k = matrix.keys[k]
        for j in 0..other.hash.keys.count do
          @matrix[@k].keys.count.times do |i|
          @i = @matrix[@k].keys[i]
              if other.hash[@i][j] != 0 then
                @mul += @matrix[@k][@i] * other.hash[@i][j]
              end
          end
          h[j] = @mul unless @mul == 0
          @mul = 0
        end
        ms[@k] = h.clone unless h.empty?
        h.clear
      end
      ms2 = Matriz_dispersa.new(ms)
   end
end
