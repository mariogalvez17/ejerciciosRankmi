class Category < ActiveRecord::Base
	belongs_to :padre
	has_many :hijos

	scope :relaciones,->(_id){
   	self.includes(:hijos, :padre).find(_id)
	}

	scope :load_data, ->{
    self.includes(:padre, :hijos)
  }


# => Metodo que regresa toda la data relacionada con la categoria
# => donde en el priemer key del hash se enviaran los datos de la categoria, 
# => en el segundo los del padre y por ultimo los de los hijos de la categoria
  def extract_data 
  	Rails.logger.info("...#{__method__}...")
  	data=Hash.new 
  	padre= self.padre
  	hijos= self.hijos
  	data.store( self.nombre,self.attributes)
  	data.store(padre.nombre, padre.attributes)
  	hijos.each{ |hijo| data.store(hijo.nombre, hijo.attributes) }
  	Rails.logger.info "EL contenido es: #{data}"
  	return data
  end

end
