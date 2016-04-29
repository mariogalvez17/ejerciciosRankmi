class Ejercicio3
=begin
	
# Ejercicio 3 ##
Usando RUBY Crear un algoritmo al cual se le deba ingresar un array de n números enteros, 
más un numero de resultado, 
ejemplo: Input: numbers={2, 7, 11, 15}, target=9 
Este algoritmo debe ser capaz de encontrar dos números dentro del array que sumados sean igual al numero target, 
obviamente el algoritmo no puede ser un for que vaya sumando todos los números de uno en uno, 
debe tener mayor inteligencia. 
El resultado debe indicar la posición del array de los números que sumados dan el resultado esperado, 
ejemplo: Output: index1=1, index2=2

=end


	def self.ejercicio3 numbers, target
		
		output= Hash.new
		
		numbers.sort!

		puts numbers 

		unless numbers[0]< 0

			numbers.keep_if{| x| x <= target }
		
		end

		posibles=numbers.combination(2).to_a

		posibles.each do |x| 
			puts "tupla #{x}"; 
			if (x[0] + x[1] == target )
				output={'index1'=> numbers.index(x[0]), 'index2' => numbers.index(x[1])}
				break;
			end
		end
	puts "output es #{output}"
	 return output
	end

end