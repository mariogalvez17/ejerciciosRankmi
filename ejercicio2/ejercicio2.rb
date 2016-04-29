class Ejercicio2
=begin 
## EJERCICIO 2 ##

Usando RUBY Crear un algoritmo que logre resolver, si se envía una coordenada de tipo "excel", ejemplo "ZA" 
nos devuelva el numero de columna a la que pertenece, 
ejemplo:  	Input: Z // Output: 26
			Input: AA // Output: 27 Input: AB // Output: 28
=end

# => Desc solve_excel_coordinate: Metodo recibe una cadena de texto y 
# => devuelve el equivalente al numero de columna en excel
# => Se toma como un sistema numerico base 26 ddebido a los valores de A hasta Z
# => la salida corresponde al numero de la columna representado por la coordenada
	def self.solve_excel_coordinate _input

		 _input.upcase!

		exponente = _input.size - 1 
		base = 26

		output=0

		_input.each_char do | letra | 
			coordenada = letra.ord - 64 
			#puts "letra es: #{letra} con valor: #{letra.ord}";
			output += ((base ** exponente) * coordenada)
			exponente-=1
		end 

		#puts "EL valor de salida es #{output}"

		return output
	end

end