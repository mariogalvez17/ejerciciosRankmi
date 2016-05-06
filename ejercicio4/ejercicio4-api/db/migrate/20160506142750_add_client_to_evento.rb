class AddClientToEvento < ActiveRecord::Migration
  def change
    add_reference :eventos, :cliente, index: true, foreign_key: true
  end
end
