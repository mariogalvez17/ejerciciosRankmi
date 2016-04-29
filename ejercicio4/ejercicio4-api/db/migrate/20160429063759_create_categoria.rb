class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.text :nombre
      t.text :descripcion
      t.float :valor
      t.references :padre, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
