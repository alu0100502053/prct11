class Racional

	include Comparable
   attr_accessor :numerador, :denominador

   #definicion del metodo initialize para definir numerador y denominador
   def initialize(numerador, denominador)
      @numerador, @denominador = numerador, denominador
      # reducir
   end

   #definicion del metodo para reducir una fraccion
   def reducir(rac)
      mcd = gcd(rac.numerador, rac.denominador)
      racional = Racional.new((rac.numerador/mcd),rac.denominador/mcd)
   end

   #definicion del numerador num
   def num
      @numerador
   end

   #definicion del denominador denom
   def denom
      @denominador 
   end

   #definicion del metodo to_s para fraccion 
   def to_s
      "#{@numerador}/#{@denominador}"
   end

   #denificion del metodo flotante
   def flotante
      @numerador/@denominador
   end

   #definicion del metodo abs para obtener el valor absoluto
   def abs
      if @numerador < 0 then @numerador = @numerador * -1 end
      if @denominador < 0 then @denominador = @denominador * -1 end
   end

   #definicion del metodo para calcular el reciproco 
   def reciprocal
      a = @numerador
      @numerador = @denominador
      @denominador = a
   end

   #definicion del metodo para calcular el opuesto
   def -@
      @numerador = @numerador * -1
   end

   #definicion del metodo para la suma de fracciones
   def +(other)
      mcm = (@denominador * other.denominador)/gcd(@denominador, other.denominador)
      @racional = Racional.new(((mcm/@denominador*@numerador) + (mcm/other.denominador*other.numerador)),mcm)
      reducir(@racional)
   end

   #definicion del metodo para la resta de fracciones
   def -(other)
      mcm = (@denominador * other.denominador)/gcd(@denominador, other.denominador)
      @racional = Racional.new(((mcm/@denominador*@numerador) - (mcm/other.denominador*other.numerador)),mcm)
      reducir(@racional)
   end

   #definicion del metodo para la multiplicacion de fracciones
   def *(other)
      @racional = Racional.new((@numerador * other.numerador),@denominador * other.denominador)
      reducir(@racional)
   end

   #definicion del metodo para la division de fracciones
   def /(other)
   	@racional = Racional.new((@numerador * other.denominador),@denominador * other.numerador)
      reducir(@racional)
   end

   #definicion del metodo obtener el resto de una division de fracciones
   def %(other)
      (@numerador/@denominador)%(other.numerador/other.denominador)
   end

   #definicion del metodo guerra de las galaxias para comparar fracciones
   def <=>(other)
      mcm = (@denominador * other.denominador)/gcd(@denominador, other.denominador)
      a = (mcm/@denominador*@numerador)
      b = (mcm/other.denominador*other.numerador)

      if a < b
         -1
      elsif a > b
         1
      else
         0
      end
   end

#definicion del metodo coerce para racional
def coerce(other)
   if Integer === other
      [Racional.new(other,1), self ]
   end
end

end
