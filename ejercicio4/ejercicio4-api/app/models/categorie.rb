class Categorie < ActiveRecord::Base
  belongs_to :padre
  has_many :hijos
end
