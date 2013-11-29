require 'b_good'

describe Racional do
   before :each do
      @f = Racional.new(-8,4)
      @f2 = Racional.new(-54,32)
   end
   describe "Almacenamiento de las variables" do 
      it "Debe existir un numerador" do
         @f.numerador.should eq(-8)
      end
      it "Debe existir un denominador" do
         @f.denominador.should eq(4)
      end
   end
   it "Debe de estar en su forma reducida" do
      @f.reducir(@f).should eq(Racional.new(-2,1))
   end
   describe "Metodos getter" do
      it "Se debe invocar al metodo num() para obtener el numerador" do
         @f.num().should eq(-8)
      end
      it "Se debe invocar al metodo denom() para obtener el denominador" do
         @f.denom().should eq(4)
      end
   end
   describe "Metodos de mostrar" do
      it "Se debe mostrar por consola la fraccion de la forma a/b" do
         @f.to_s.should match "-8/4"
      end
      it "Se debe mostrar por consola la fraccion en forma flotante" do
         @f.flotante.should eq(-2.0)
      end
   end
   describe "Metodos de calculo" do
      it "Se debe sumar dos fracciones con + y dar el resultado de forma reducida" do
         @f.+(@f2).should eq(Racional.new(-59,16))
      end
      it "Se debe restar dos fracciones con - y dar el resultado de forma reducida" do
         @f.-(@f2).should eq(Racional.new(-5,16))
      end
      it "Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida" do
         @f.*(@f2).should eq(Racional.new(27,8))
      end
      it "Se debe dividir dos fracciones con / y dar el resultado de forma reducida" do
         @f./(@f2).should eq(Racional.new(-32,-27))
      end
      it "Se debe calcular el resto dos fracciones con % y dar el resultado de forma reducida" do
         @f3 = Racional.new(-27.0,16.0)
         @f.%(@f3).should eq(-0.3125)
      end
      it "Se debe calcular el valor absoluto de una fraccion con el metodo abs" do
         @f.abs
         @f.numerador.should eq(8)
         @f.denominador.should eq(4)
      end

      it "Se debe calcular el reciproco de una fraccion con el metodo reciprocal" do
         @f.reciprocal
         @f.numerador.should eq(4)
         @f.denominador.should eq(-8)
      end
      it "Se debe calcular el opuesto de una fraccion con -@" do
         @f.-@
         @f.numerador.should eq(8)
      end
   end
   describe "Metodos de comparacion" do
      it "Se debe comparar si dos fracciones son iguales con ==" do
         @f3 = Racional.new(-8,4)
         @f4 = Racional.new(1,6)
         @f.==(@f3).should be true
         @f.==(@f4).should be false 
      end
      it "Se debe de poder comprobar si una fracion es menor que otra" do
         @f3 = Racional.new(1,3)
         @f4 = Racional.new(-16,2)
         @f.<(@f3).should be true
         @f.<(@f4).should be false
      end
      it "Se debe de poder comprobar si una fracion es mayor que otra" do
         @f3 = Racional.new(1,3)      
         @f4 = Racional.new(-16,2)
         @f.>(@f3).should be false
         @f.>(@f4).should be true
      end
      it "Se debe de poder comprobar si una fracion es menor o igual que otra" do
         @f3 = Racional.new(1,3)
         @f4 = Racional.new(-16,2)
         @f5 = Racional.new(-8,4)
         @f.<=(@f3).should be true
         @f.<=(@f4).should be false
         @f.<=(@f5).should be true
      end
      it "Se debe de poder comprobar si una fracion es mayor o igual que otra" do
         @f3 = Racional.new(1,3)
         @f4 = Racional.new(-16,2)
         @f5 = Racional.new(-8,4)
         @f.>=(@f3).should be false
         @f.>=(@f4).should be true
         @f.>=(@f5).should be true
      end
   end
end

describe Matriz_densa do
	before :each do
		@Matriz_densa = Matriz_densa.new([1,2,3],[4,5,6],[7,8,9])
		@Matriz_densa22 = Matriz_densa.new([1,2],[4,5])
		@Matriz_densa2 = Matriz_densa.new([3,2,1],[6,5,4],[9,8,7])
		@Matriz_densa5 = Matriz_densa.new([Racional.new(1,3),Racional.new(2,3)],[Racional.new(3,4),Racional.new(5,9)])
		@Matriz_densa6 = Matriz_densa.new([Racional.new(1,5),Racional.new(5,3)],[Racional.new(5,4),Racional.new(6,9)])
	end
	it "Debe comprobar que la Matriz_densa es cuadrada" do
		expect { Matriz_densa.new([2,3,3],[3,4],[1,2,3]) }.to raise_error
		expect { Matriz_densa.new([2,3,3],[1,2,3]) }.to raise_error
	end

	it "debe encontrar el primer elemento cuadrado mayor que 6" do
		(@Matriz_densa.encontrar {|e| e*e > 6})[0].should eq(0)
		(@Matriz_densa.encontrar {|e| e*e > 6})[1].should eq(2)
	end

	it "Debe poder accederse a los elementos de la Matriz_densa" do
		@Matriz_densa[0][0].should eq(1)
		@Matriz_densa[0][1].should eq(2)
		@Matriz_densa[0][2].should eq(3)
		@Matriz_densa[1][0].should eq(4)
		@Matriz_densa[1][1].should eq(5)
		@Matriz_densa[1][2].should eq(6)
		@Matriz_densa[2][0].should eq(7)
		@Matriz_densa[2][1].should eq(8)
		@Matriz_densa[2][2].should eq(9)
		@Matriz_densa5[0][0].should eq(Racional.new(1,3))
	end

	it "Debe sumar dos matrices" do
		@Matriz_densa3 = @Matriz_densa + @Matriz_densa2
		@Matriz_densa7 = @Matriz_densa5 + @Matriz_densa6
		@Matriz_densa8 = @Matriz_densa22 + @Matriz_densa6
		@Matriz_densa3[0][0].should eq(4)
		@Matriz_densa3[0][1].should eq(4)
		@Matriz_densa3[0][2].should eq(4)
		@Matriz_densa3[1][0].should eq(10)
		@Matriz_densa3[1][1].should eq(10)
		@Matriz_densa3[1][2].should eq(10)
		@Matriz_densa3[2][0].should eq(16)
		@Matriz_densa3[2][1].should eq(16)
		@Matriz_densa3[2][2].should eq(16)
		@Matriz_densa7[0][0].should eq(Racional.new(8,15))
		@Matriz_densa8[0][0].should eq(Racional.new(6,5))
	end

	it "Debe hallar el maximo de una matriz" do
		max = @Matriz_densa.maximo
		max.should eq(9)
	end

	it "Debe hallar el minimo de una matriz" do
		min = @Matriz_densa.minimo
		min.should eq(1)
	end

	it "Debe restar dos matrices" do
		@Matriz_densa3 = @Matriz_densa - @Matriz_densa2
		@Matriz_densa7 = @Matriz_densa5 - @Matriz_densa6
		@Matriz_densa8 = @Matriz_densa22 - @Matriz_densa6
		@Matriz_densa3[0][0].should eq(-2)
		@Matriz_densa3[0][1].should eq(0)
		@Matriz_densa3[0][2].should eq(2)
		@Matriz_densa3[1][0].should eq(-2)
		@Matriz_densa3[1][1].should eq(0)
		@Matriz_densa3[1][2].should eq(2)
		@Matriz_densa3[2][0].should eq(-2)
		@Matriz_densa3[2][1].should eq(0)
		@Matriz_densa3[2][2].should eq(2)
		@Matriz_densa7[0][0].should eq(Racional.new(2,15))
		@Matriz_densa8[0][0].should eq(Racional.new(4,5))
	end

	it "Debe multiplicar dos matrices" do
		@Matriz_densa3 = @Matriz_densa * @Matriz_densa2
		@Matriz_densa7 = @Matriz_densa5 * @Matriz_densa6
		@Matriz_densa8 = @Matriz_densa22 * @Matriz_densa6
		@Matriz_densa3[0][0].should eq(42)
		@Matriz_densa3[0][1].should eq(36)
		@Matriz_densa3[0][2].should eq(30)
		@Matriz_densa3[1][0].should eq(96)
		@Matriz_densa3[1][1].should eq(81)
		@Matriz_densa3[1][2].should eq(66)
		@Matriz_densa3[2][0].should eq(150)
		@Matriz_densa3[2][1].should eq(126)
		@Matriz_densa3[2][2].should eq(102)
		@Matriz_densa7[0][0].should eq(Racional.new(9,10))
		@Matriz_densa8[0][0].should eq(Racional.new(27,10))
	end
end

describe Matriz_dispersa do
	before :each do
		@Matriz_dispersa = Matriz_dispersa.new(100 => {100 => 1, 500 => 200},  20000 => { 1000 => 3, 9000 => 200})
		@Matriz_dispersa2 = Matriz_dispersa.new(100 => {100 => 2, 50 => 3},  200 => { 30 => 10})
		@Matriz_frac = Matriz_dispersa.new(0 => {0 => Racional.new(1,3), 1 => Racional.new(1,3)}, 2 => {0 => Racional.new(1,3), 2 => Racional.new(1,3)})
		@Matriz_frac2 = Matriz_dispersa.new(0 => {0 => Racional.new(6,3), 1 => Racional.new(5,3)}, 2 => {0 => Racional.new(5,3), 2 => Racional.new(2,3)})
	end
	it "Debe poder acceder a los elementos de la matriz" do
		@Matriz_dispersa[0][0].should eq(0)
		@Matriz_dispersa[100][100].should eq(1)
		@Matriz_dispersa[100][500].should eq(200)
	end

	it "Debe poder sumar una matriz dispersa con otra" do
		@Matriz_dispersa3 = @Matriz_dispersa + @Matriz_dispersa2
		@Matriz_dispersa3[100][100].should eq(3)
		@Matriz_dispersa3[100][50].should eq(3)
		@Matriz_dispersa3[100][500].should eq(200)
		@Matriz_dispersa3[200][30].should eq(10)
		@Matriz_dispersa3[20000][1000].should eq(3)
		@Matriz_dispersa3[20000][9000].should eq(200)
		@Matriz_dispersa4 = @Matriz_frac + @Matriz_frac2
		@Matriz_dispersa4[0][0].should eq(Racional.new(7,3))
		@Matriz_dispersa4[0][1].should eq(Racional.new(2,1))
		@Matriz_dispersa4[2][0].should eq(Racional.new(2,1))
	end

	it "Debe poder restar una matriz dispersa con otra" do
		@Matriz_dispersa3 = @Matriz_dispersa - @Matriz_dispersa2
		@Matriz_dispersa3[100][100].should eq(-1)
		@Matriz_dispersa3[100][50].should eq(3)
		@Matriz_dispersa3[100][500].should eq(200)
		@Matriz_dispersa3[200][30].should eq(10)
		@Matriz_dispersa3[20000][1000].should eq(3)
		@Matriz_dispersa3[20000][9000].should eq(200)
	end

	it "Debe poder multiplicar una matriz dispersa con otra" do
		@a = Matriz_dispersa.new(0 => {0 => 7, 1 => 1}, 2 => {0 => 2, 2 => 3})
		@b = Matriz_dispersa.new(0 => {0 => 2, 1 => 3}, 1 => {0 => 2}, 2 => {2 => 1})
		@c = Matriz_dispersa.new(0 => {0 => 1}, 1 => {1 => 2}, 2 => {2 => 2})
		@d = Matriz_dispersa.new(0 => {0 => 3, 2 => 2}, 2 => {0 => 1, 2 => 2})
		@e = Matriz_dispersa.new(0 => {1 => 2, 2 => 1}, 1 => {1 => 3}, 3 => {0 => 1})
		@f = Matriz_dispersa.new(1 => {1 => 1, 2 => 3}, 2 => {0 => 2})
		@g = @Matriz_frac * @Matriz_frac2
		@g[0][0].should eq(Racional.new(2,3))
		@Matriz_dispersa3 = @a * @b
		@Matriz_dispersa3[0][0].should eq(16)
		@Matriz_dispersa3[0][1].should eq(21)
		@Matriz_dispersa3[2][0].should eq(4)
		@Matriz_dispersa3[2][1].should eq(6)
		@Matriz_dispersa3[2][2].should eq(3)
		@Matriz_dispersa4 = @c * @d
		@Matriz_dispersa4[0][0].should eq(3)
		@Matriz_dispersa4[0][2].should eq(2)
		@Matriz_dispersa4[2][0].should eq(2)
		@Matriz_dispersa4[2][2].should eq(4)
		@Matriz_dispersa4 = @e * @f
		@Matriz_dispersa4[0][0].should eq(2)
		@Matriz_dispersa4[0][1].should eq(2)
		@Matriz_dispersa4[0][2].should eq(6)
		@Matriz_dispersa4[1][1].should eq(3)
		@Matriz_dispersa4[1][2].should eq(9)
	end
	it "Debe operar una matriz dispersa con una densa" do
		@densa = Matriz_densa.new([1,2,4],[4,3,2],[7,6,4])
		@dispersa = Matriz_dispersa.new(1 => {1 => 1, 2 => 3}, 2 => {0 => Racional.new(1,2)})
		@suma = @densa + @dispersa
		@suma[0][0].should eq(1)
		@suma[0][1].should eq(2)
		@suma[0][2].should eq(4)
		@suma[1][0].should eq(4)
		@suma[1][1].should eq(4)
		@suma[1][2].should eq(5)
		@suma[2][0].should eq(Racional.new(15,2))
		@suma[2][1].should eq(6)
		@suma[2][2].should eq(4)

		@mult = @densa * @dispersa
		@mult[0][0].should eq(Racional.new(2,1))
		@mult[0][1].should eq(2)
		@mult[0][2].should eq(6)
		@mult[1][0].should eq(Racional.new(1,1))
		@mult[1][1].should eq(3)
		@mult[1][2].should eq(9)
		@mult[2][0].should eq(Racional.new(2,1))
		@mult[2][1].should eq(6)
		@mult[2][2].should eq(18)
	end

	it "Debe hallar el maximo de una matriz" do
		max = @Matriz_dispersa.maximo
		max.should eq(200)
	end

	it "Debe hallar el minimo de una matriz" do
		min = @Matriz_dispersa.minimo
		min.should eq(1)
	end
end