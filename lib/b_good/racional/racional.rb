class Racional

	include Comparable
   attr_accessor :numerador, :denominador

   def initialize(numerador, denominador)
      @numerador, @denominador = numerador, denominador
      # reducir
   end

   def reducir(rac)
      mcd = gcd(rac.numerador, rac.denominador)
      racional = Racional.new((rac.numerador/mcd),rac.denominador/mcd)
   end

   def num
      @numerador
   end

   def denom
      @denominador 
   end

   def to_s
      "#{@numerador}/#{@denominador}"
   end

   def flotante
      @numerador/@denominador
   end

   def abs
      if @numerador < 0 then @numerador = @numerador * -1 end
      if @denominador < 0 then @denominador = @denominador * -1 end
   end

   def reciprocal
      a = @numerador
      @numerador = @denominador
      @denominador = a
   end

   def -@
      @numerador = @numerador * -1
   end

   def +(other)
      mcm = (@denominador * other.denominador)/gcd(@denominador, other.denominador)
      @racional = Racional.new(((mcm/@denominador*@numerador) + (mcm/other.denominador*other.numerador)),mcm)
      reducir(@racional)
   end

   def -(other)
      mcm = (@denominador * other.denominador)/gcd(@denominador, other.denominador)
      @racional = Racional.new(((mcm/@denominador*@numerador) - (mcm/other.denominador*other.numerador)),mcm)
      reducir(@racional)
   end

   def *(other)
      @racional = Racional.new((@numerador * other.numerador),@denominador * other.denominador)
      reducir(@racional)
   end

   def /(other)
   	@racional = Racional.new((@numerador * other.denominador),@denominador * other.numerador)
      reducir(@racional)
   end

   def %(other)
      (@numerador/@denominador)%(other.numerador/other.denominador)
   end

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

   
def coerce(other)
   if Integer === other
      [Racional.new(other,1), self ]
   end
end

end
