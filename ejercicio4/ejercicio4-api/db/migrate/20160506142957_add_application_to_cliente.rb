class AddApplicationToCliente < ActiveRecord::Migration
  def change
    add_reference :clientes, :application, index: true, foreign_key: true
  end
end
