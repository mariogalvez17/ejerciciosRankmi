class AddCategorieToHijos < ActiveRecord::Migration
  def change
    add_reference :hijos, :category, index: true, foreign_key: true
  end
end
