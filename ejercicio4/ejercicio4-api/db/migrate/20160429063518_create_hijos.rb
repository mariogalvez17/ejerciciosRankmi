class CreateHijos < ActiveRecord::Migration
  def change
    create_table :hijos do |t|
      t.text :nombre

      t.timestamps null: false
    end
  end
end
