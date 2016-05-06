class Cliente < ActiveRecord::Base
has_many :eventos
belongs_to :application
end
