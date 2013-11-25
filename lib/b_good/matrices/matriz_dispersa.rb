class Vector_disperso
  attr_reader :vector

  def initialize(h = {})
    @vector = Hash.new(0)
    @vector = @vector.merge!(h)
  end

  def to_s
    @vector.to_s
  end

  def keys
    @vector.keys
  end

  def hash
    @vector
  end

  def +(other)
    @vector.merge!(other.hash){|key, oldval, newval| newval + oldval}
  end

  def -(other)
    @vector.merge!(other.hash){|key, oldval, newval| newval - oldval}
  end

  def []= (i,v)
    @vector[i] = v
  end

  def [](i)
    @vector[i] 
  end
end

class Matriz_dispersa < Matriz
  attr_reader :matrix

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

  def [](i)
    @matrix[i]
  end

  def hash
    @matrix
  end

  def keys
    @matrix.keys
  end

  def col(j)
    c = {}
    for r in @matrix.keys do
      c[r] = @matrix[r].vector[j] if @matrix[r].vector.keys.include? j
    end
    Vector_disperso.new c
  end

  #Para la suma de matrices
  def +(other)  
    ms = @matrix.clone
    ms.merge!(other.hash){ |key, oldval, newval| newval + oldval}
  end

  #Para la resta de matrices
  def -(other)  
    ms = @matrix.clone
    ms.merge!(other.hash){ |key, oldval, newval| newval - oldval}
  end

  #Para la multiplicacion de matrices
  def *(other)  
    ms = Hash.new(0)
    h = Hash.new(0)
    @mul = 0
    @matrix.keys.count.times do |k|
      @k =  @matrix.keys[k]
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
