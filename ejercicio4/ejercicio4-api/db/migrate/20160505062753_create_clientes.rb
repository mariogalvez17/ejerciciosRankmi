class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.text :ip
      t.text :browser
      t.text :system

      t.timestamps null: false
    end
  end
end
