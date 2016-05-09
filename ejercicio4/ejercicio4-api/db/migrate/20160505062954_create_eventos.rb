class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.text :nombre
      t.text :params

      t.timestamps null: false
    end
  end
end
