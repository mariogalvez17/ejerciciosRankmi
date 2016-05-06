class AddHoraToEvento < ActiveRecord::Migration
  def change
    add_column :eventos, :hora, :timestamps
  end
end
