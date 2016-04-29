class CreatePadres < ActiveRecord::Migration
  def change
    create_table :padres do |t|
      t.text :nombre

      t.timestamps null: false
    end
  end
end
