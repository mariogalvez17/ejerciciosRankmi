class Application < ActiveRecord::Base
has_many :eventos 
has_many :clientes
end
