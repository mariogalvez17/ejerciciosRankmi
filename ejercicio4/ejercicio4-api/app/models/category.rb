class Category < ActiveRecord::Base
	belongs_to :padre
	has_many :hijos

	scope :relaciones,->(_id){
   	self.includes(:hijos, :padre).find(_id)
	}

	scope :load_data, ->{
    self.includes(:padre, :hijos)
  }

  def extract_data 
  	Rails.logger.info("...#{__method__}...")
  	padre= self.padre
  	hijos= self.hijos
  	Rails.logger.info "EL contenido es: #{data}"
  end

end
