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


	#=> Desc finAddress: Metodo para conseguir los indices de  2 elementos de un arreglo que producen una suma igual al parametro target 
	#=>Inputs
		#=> numbers: Arreglo de numeros a evaluar
		#=> target: Resultado buscado
	#=>Output: hash con los dos indices del arreglo numbers que summados son igual a target

	def self.find_adders numbers, target
		
		output= Hash.new
		
		numbers.sort!
		
		unless numbers[0] < 0 	 # Se agrega por validacion de numeros negativos en el array en entrada  
			
			limite = numbers.bsearch{|x| x <= target } 	# Realiza busqueda binaria sobre el arreglo  		
			
			numbers= numbers.take(limite.to_i + 1) 		# limita el vector a la region relevante
		
		end

		parejas=numbers.combination(2).to_a
		
		parejas.to_a.each do |x| 
		
		#puts "tupla #{x}"; 
		
			if (x[0] + x[1] == target )
				
				output={'index1'=> numbers.index(x[0]), 'index2' => numbers.index(x[1])}
				break;
			
			end
		
		end
		
		#puts "output es #{output}"

		return output

	end
	#Validado para numeros negativos en el arreglo de entrada, optimizado para numeros positivos
end