class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.text :nombre
      t.text :token

      t.timestamps null: false
    end
  end
end
