class AddCategoriaToHijos < ActiveRecord::Migration
  def change
    add_reference :hijos, :categoria, index: true, foreign_key: true
  end
end
